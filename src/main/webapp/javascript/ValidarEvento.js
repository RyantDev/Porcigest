const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('#formulario input');

const expresiones = {
    nombre: /^[A-Za-z0-9\s]+$/, // Letras y espacios, pueden llevar acentos.
    fecha: /^\d{4}-\d{2}-\d{2}$/, // Fecha
    descripcion: /^[\w\s.,!?'"()-]+$/ // Descripcion
}

const campos = {
    nombre_evento: false,
    descripcion_evento: false,
    fecha_evento: false
}

const ValidarForm = (e) => {
    let NombreCampo = e.target.name;
    console.log(NombreCampo);
    switch (NombreCampo) {
        case "nombre_evento":
            validarCampo(expresiones.nombre, e.target, NombreCampo);
            break;
        case "descripcion_evento":
            validarCampo(expresiones.descripcion, e.target, NombreCampo);
            break;
        case "fecha_evento":
            validarCampo(expresiones.fecha, e.target, NombreCampo);
            break;
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

inputs.forEach((input) => {
    // input.addEventListener('keyup', ValidarForm);
    input.addEventListener('blur', ValidarForm);
});

function MiFuncion() {
    if (campos.nombre_evento && campos.descripcion_evento && campos.fecha_evento) {
        document.getElementById('formulario__mensaje').classList.remove('formulario__mensaje-activo');
        document.getElementById('formulario__mensaje-exito').classList.add('formulario__mensaje-exito-activo');
        setTimeout(function () {
            // Retrasa el envío del formulario después de 5 segundos (2000 milisegundos)
            document.getElementById('formulario').submit();
            formulario.reset();
        }, 2000);
        document.querySelectorAll('.formulario__grupo-correcto').forEach((icono) => {
            icono.classList.remove('formulario__grupo-correcto');
        });
        return false;
    } else {
        document.getElementById('formulario__mensaje').classList.add('formulario__mensaje-activo');
        setTimeout(() => {
            document.getElementById('formulario__mensaje').classList.remove('formulario__mensaje-activo');
        }, 2000);
        return false;

    }
}
