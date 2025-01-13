document.querySelector('.login-form').addEventListener('submit', function(event) {
    event.preventDefault();
    const button = event.target.querySelector('button');
    button.innerHTML = 'Entrando...';
    button.disabled = true;    
});