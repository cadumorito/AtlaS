document.addEventListener("DOMContentLoaded", function () {
    const mainContent = document.getElementById('main-content');

    function loadPage(page) {
        fetch(`${page}.html`)
            .then(response => {
                if (!response.ok) throw new Error('Página não encontrada');
                return response.text();
            })
            .then(data => {
                mainContent.innerHTML = data;

                // Carregar o CSS específico
                const link = document.createElement('link');
                link.rel = 'stylesheet';
                link.href = `${page}.css`; // CSS com o mesmo nome da página
                document.head.appendChild(link);
            })
            .catch(error => {
                console.error('Erro ao carregar a página:', error);
                mainContent.innerHTML = '<h1>Erro ao carregar a página</h1>';
            });
    }

    // Carrega a página inicial
    if (window.location.hash) {
        loadPage(window.location.hash.substring(1));
    } else {
        loadPage('home'); // página inicial padrão
    }

    // Navegação
    document.querySelectorAll('.nav-link').forEach(link => {
        link.addEventListener('click', function (event) {
            event.preventDefault();
            const page = this.getAttribute('href').substring(1);
            loadPage(page);
            window.location.hash = page; // Atualiza a URL
        });
    });
});
