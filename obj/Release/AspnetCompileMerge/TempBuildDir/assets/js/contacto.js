document.addEventListener('DOMContentLoaded', function () {
    iniciarAPP();
})

function iniciarAPP() {
    configBotonEnviar();
}

function configBotonEnviar() {
    const boton = document.querySelector('.boton');
    boton.addEventListener('click', function (e) {
        e.preventDefault();

    })
}