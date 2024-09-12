document.addEventListener('mousemove', (e) => {
    const x = e.clientX;
    const y = e.clientY;
    const maxX = window.innerWidth - 10; // subtract cursor width
    const maxY = window.innerHeight - 10; // subtract cursor height
  
    x = Math.max(0, Math.min(x, maxX));
    y = Math.max(0, Math.min(y, maxY));
  
    cursor.style.transform = `translate(${x}px, ${y}px)`;
  });