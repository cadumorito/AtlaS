document.addEventListener('DOMContentLoaded', () => {
    const periodRadios = document.querySelectorAll('input[name="period"]');
    const turnRadios = document.querySelectorAll('input[name="turn"]');

    const calendarios = {
        'manha-antes': { container: document.getElementById('calendario-manha-antes'), bookedDates: [15], selectedDays: {}, currentMonth: new Date().getMonth(), currentYear: new Date().getFullYear(), monthDisplay: document.getElementById('monthDisplayManhaAntes') },
        'manha-apos': { container: document.getElementById('calendario-manha-apos'), bookedDates: [2], selectedDays: {}, currentMonth: new Date().getMonth(), currentYear: new Date().getFullYear(), monthDisplay: document.getElementById('monthDisplayManhaApos') },
        'tarde-antes': { container: document.getElementById('calendario-tarde-antes'), bookedDates: [10], selectedDays: {}, currentMonth: new Date().getMonth(), currentYear: new Date().getFullYear(), monthDisplay: document.getElementById('monthDisplayTardeAntes') },
        'tarde-apos': { container: document.getElementById('calendario-tarde-apos'), bookedDates: [20], selectedDays: {}, currentMonth: new Date().getMonth(), currentYear: new Date().getFullYear(), monthDisplay: document.getElementById('monthDisplayTardeApos') },
    };

    const monthNames = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];
    const monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    // Função para verificar ano bissexto
    function isLeapYear(year) {
        return (year % 4 === 0 && year % 100 !== 0) || year % 400 === 0;
    }

    function createCalendar(calendarObj) {
        const calendar = calendarObj.container.querySelector('.calendar');
        const month = calendarObj.currentMonth;
        const year = calendarObj.currentYear;
        const daysInMonth = month === 1 && isLeapYear(year) ? 29 : monthDays[month];
        const today = new Date();

        // Atualiza o texto do mês e ano
        calendarObj.monthDisplay.textContent = `${monthNames[month]} ${year}`;

        calendar.innerHTML = ''; // Limpa o calendário

        for (let i = 1; i <= daysInMonth; i++) {
            const day = document.createElement('div');
            day.classList.add('day');
            day.textContent = i;

            const selectedDate = new Date(year, month, i);
            if (selectedDate < today) {
                day.classList.add('booked');
                day.onclick = () => alert('Essa data já passou!');
            } else if (calendarObj.bookedDates.includes(i)) {
                day.classList.add('booked');
                day.onclick = () => alert('Data já reservada!');
            } else {
                // Verifica se o dia está selecionado
                if (calendarObj.selectedDays[`${year}-${month}`]?.includes(i)) {
                    day.classList.add('selected');
                }

                day.onclick = () => {
                    // Inicializa o array se ainda não existir para o ano e mês atual
                    if (!calendarObj.selectedDays[`${year}-${month}`]) {
                        calendarObj.selectedDays[`${year}-${month}`] = [];
                    }

                    // Adiciona ou remove o dia da seleção
                    if (calendarObj.selectedDays[`${year}-${month}`].includes(i)) {
                        calendarObj.selectedDays[`${year}-${month}`] = calendarObj.selectedDays[`${year}-${month}`].filter(day => day !== i); // Remove da seleção
                        day.classList.remove('selected'); // Remove a classe de seleção
                    } else {
                        calendarObj.selectedDays[`${year}-${month}`].push(i); // Adiciona à seleção
                        day.classList.add('selected'); // Adiciona a classe de seleção
                    }
                };
            }

            calendar.appendChild(day);
        }
    }

    function toggleCalendars() {
        const selectedTurn = document.querySelector('input[name="turn"]:checked')?.value;
        const selectedPeriod = document.querySelector('input[name="period"]:checked')?.value;

        Object.values(calendarios).forEach(cal => cal.container.style.display = 'none');

        if (selectedTurn === 'antes' && selectedPeriod === 'antes') {
            calendarios['manha-antes'].container.style.display = 'block';
            createCalendar(calendarios['manha-antes']);
        } else if (selectedTurn === 'antes' && selectedPeriod === 'após') {
            calendarios['manha-apos'].container.style.display = 'block';
            createCalendar(calendarios['manha-apos']);
        } else if (selectedTurn === 'após' && selectedPeriod === 'antes') {
            calendarios['tarde-antes'].container.style.display = 'block';
            createCalendar(calendarios['tarde-antes']);
        } else if (selectedTurn === 'após' && selectedPeriod === 'após') {
            calendarios['tarde-apos'].container.style.display = 'block';
            createCalendar(calendarios['tarde-apos']);
        }

        // Oculta o texto de placeholder quando ambos forem selecionados
        const calendarPlaceholder = document.getElementById('calendar-placeholder');
        if (selectedTurn && selectedPeriod) {
            calendarPlaceholder.style.display = 'none'; // Esconde o H2
        } else {
            calendarPlaceholder.style.display = 'block'; // Mostra o H2 se nada estiver selecionado
        }
    }

    // Adiciona evento para alternar entre calendários
    turnRadios.forEach(radio => {
        radio.addEventListener('change', toggleCalendars);
    });
    periodRadios.forEach(radio => {
        radio.addEventListener('change', toggleCalendars);
    });

    // Funções para navegação entre meses
    document.getElementById('prevMonthManhaAntes').addEventListener('click', (event) => {
        event.preventDefault(); // Impede o comportamento padrão do botão
        changeMonth(calendarios['manha-antes'], -1);
    });
    document.getElementById('nextMonthManhaAntes').addEventListener('click', (event) => {
        event.preventDefault(); // Impede o comportamento padrão do botão
        changeMonth(calendarios['manha-antes'], 1);
    });

    document.getElementById('prevMonthManhaApos').addEventListener('click', (event) => {
        event.preventDefault(); // Impede o comportamento padrão do botão
        changeMonth(calendarios['manha-apos'], -1);
    });
    document.getElementById('nextMonthManhaApos').addEventListener('click', (event) => {
        event.preventDefault(); // Impede o comportamento padrão do botão
        changeMonth(calendarios['manha-apos'], 1);
    });

    document.getElementById('prevMonthTardeAntes').addEventListener('click', (event) => {
        event.preventDefault(); // Impede o comportamento padrão do botão
        changeMonth(calendarios['tarde-antes'], -1);
    });
    document.getElementById('nextMonthTardeAntes').addEventListener('click', (event) => {
        event.preventDefault(); // Impede o comportamento padrão do botão
        changeMonth(calendarios['tarde-antes'], 1);
    });

    document.getElementById('prevMonthTardeApos').addEventListener('click', (event) => {
        event.preventDefault(); // Impede o comportamento padrão do botão
        changeMonth(calendarios['tarde-apos'], -1);
    });
    document.getElementById('nextMonthTardeApos').addEventListener('click', (event) => {
        event.preventDefault(); // Impede o comportamento padrão do botão
        changeMonth(calendarios['tarde-apos'], 1);
    });

    // Função para alterar o mês
    function changeMonth(calendarObj, direction) {
        calendarObj.currentMonth += direction;
        if (calendarObj.currentMonth < 0) {
            calendarObj.currentMonth = 11;
            calendarObj.currentYear -= 1;
        } else if (calendarObj.currentMonth > 11) {
            calendarObj.currentMonth = 0;
            calendarObj.currentYear += 1;
        }
        createCalendar(calendarObj);
    }

    // Inicializa o calendário
    toggleCalendars();
});
