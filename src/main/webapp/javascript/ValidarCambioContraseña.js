const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('#formulario input');

const expresiones = {
    cedula: /^\d{10}$/, // Letras y espacios, pueden llevar acentos.
    password: /^.{4,12}$/, // 4 a 12 digitos.
}

const campos = {
    cedula_usuario: false,
    contraseña_antigua: false,
    contraseña_clave: false,
    confirmar_contraseña: false
}

const ValidarForm = (e) => {
    let NombreCampo = e.target.name;
    console.log(NombreCampo);
    switch (NombreCampo) {
        case "contraseña_antigua":
        case "contraseña_clave":
            validarCampo(expresiones.password, e.target, NombreCampo);
            break;
        case "confirmar_contraseña":
            validarPassword2();
        case "cedula_usuario":
            validarCampo(expresiones.cedula, e.target, NombreCampo);
        default:
            break;
    }
}

const validarCampo = (expre, input, campo) => {
    if (expre.test(input.value)) {
        document.getElementById(`grupo__${campo}`).classList.remove('formulario__grupo-incorrecto');
        document.getElementById(`grupo__${campo}`).classList.add('formulario__grupo-correcto');
        document.querySelector(`#grupo__${campo} i`).classList.add('fa-check-circle');
        document.querySelector(`#grupo__${campo} i`).classList.remove('fa-times-circle');
        document.querySelector(`#grupo__${campo} .formulario__input-error`).classList.remove('formulario__input-error-activo');
        campos[campo] = true;
    } else {
        document.getElementById(`grupo__${campo}`).classList.add('formulario__grupo-incorrecto');
        document.getElementById(`grupo__${campo}`).classList.remove('formulario__grupo-correcto');
        document.querySelector(`#grupo__${campo} i`).classList.add('fa-times-circle');
        document.querySelector(`#grupo__${campo} i`).classList.remove('fa-check-circle');
        document.querySelector(`#grupo__${campo} .formulario__input-error`).classList.add('formulario__input-error-activo');
        campos[campo] = false;
    }
}


const validarPassword2 = () => {
    const inputPassword1 = document.getElementById('contraseña_nueva');
    const inputPassword2 = document.getElementById('confirmar_contraseña');

    if (inputPassword1.value !== inputPassword2.value) {
        document.getElementById(`confirmar_contraseña`).classList.add('formulario__grupo-incorrecto');
        document.getElementById(`confirmar_contraseña`).classList.remove('formulario__grupo-correcto');
        document.querySelector(`#grupo__confirmar_contraseña i`).classList.add('fa-times-circle');
        document.querySelector(`#grupo__confirmar_contraseña i`).classList.remove('fa-check-circle');
        document.querySelector(`#grupo__confirmar_contraseña .formulario__input-error`).classList.add('formulario__input-error-activo');
        campos['confirmar_contraseña'] = false;
    } else {
        console.log("Corecto");
        document.getElementById(`confirmar_contraseña`).classList.remove('formulario__grupo-incorrecto');
        document.getElementById(`confirmar_contraseña`).classList.add('formulario__grupo-correcto');
        document.querySelector(`#grupo__confirmar_contraseña i`).classList.remove('fa-times-circle');
        document.querySelector(`#grupo__confirmar_contraseña i`).classList.add('fa-check-circle');
        document.querySelector(`#grupo__confirmar_contraseña .formulario__input-error`).classList.remove('formulario__input-error-activo');
        campos['confirmar_contraseña'] = true;
    }
}

inputs.forEach((input) => {
    // input.addEventListener('keyup', ValidarForm);
    input.addEventListener('blur', ValidarForm);
});

formulario.addEventListener('submit', (e) => {
    e.preventDefault();
    if (campos.contraseña_antigua && campos.contraseña_clave && campos.confirmar_contraseña && campos.cedula_usuario) {
        document.getElementById('formulario__mensaje').classList.remove('formulario__mensaje-activo');
        formulario.reset();
        document.getElementById('formulario__mensaje').classList.remove('formulario__mensaje-activo');
        document.getElementById('formulario__mensaje-exito').classList.add('formulario__mensaje-exito-activo');
        setTimeout(() => {
            document.getElementById('formulario__mensaje-exito').classList.remove('formulario__mensaje-exito-activo');
        }, 5000);
        document.querySelectorAll('.formulario__grupo-correcto').forEach((icono) => {
            icono.classList.remove('formulario__grupo-correcto');
        });
    } else {
        document.getElementById('formulario__mensaje').classList.add('formulario__mensaje-activo');
        setTimeout(() => {
            document.getElementById('formulario__mensaje').classList.remove('formulario__mensaje-activo');
        }, 2000);
    }
});

