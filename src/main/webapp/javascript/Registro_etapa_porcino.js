const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('#formulario input');
const OptionSelected = document.querySelectorAll('#formulario select');

const expresiones = {
    fecha: /^\d{4}-\d{2}-\d{2}$/, // Letras, numeros, guion y guion_bajo
    promedio: /^-?\d+([.,]\d+)?$/, // Decimales con punto  o Enteros
    id: /^[^a-zA-Z]{1,20}$/, // No mas de 20  Digitos.
    descripcion: /^[\w\s.,!?'"()-]+$/, //  Descripcion de todo
}

const campos = {
    id_etapa: false,
    id_lote: false,
    fecha_inicial: false,
    fecha_final: false,
    peso_inicial: false,
    peso_final: false,
    estado: false
}

const ValidarForm = (e) => {
    let NombreCampo = e.target.name;
    console.log(NombreCampo);
    switch (NombreCampo) {
        case "id_etapa":
        case "id_lote":
            validarCampo(expresiones.id, e.target, NombreCampo);
            break;
        case "fecha_inicial":
        case "fecha_final":
            validarCampo(expresiones.fecha, e.target, NombreCampo);
            break;
        case "peso_inicial":
        case "peso_final":
            console.log("Fecha");
            validarCampo(expresiones.promedio, e.target, NombreCampo);
            break;
        case "estado":
            console.log("Entro Ids");
            validarCampo(expresiones.descripcion, e.target, NombreCampo);
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

OptionSelected.forEach((Option) => {
    // input.addEventListener('keyup', ValidarForm);
    Option.addEventListener('blur', ValidarForm);
});


function MiFuncion() {
    if (campos.id_etapa && campos.id_lote && campos.fecha_inicial && campos.fecha_final  && campos.peso_inicial && campos.peso_final && campos.estado) {
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


