const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('#formulario input');
const OptionSelected = document.querySelectorAll('#formulario select');

const expresiones = {
    fecha: /^\d{4}-\d{2}-\d{2}$/, // Letras, numeros, guion y guion_bajo
    genero: /^(Masculino|Femenino)$/,
    id: /^[^a-zA-Z]{1,20}$/, // No mas de 20  Digitos.
    id_corral: /^[^a-zA-Z]{1,20}$/
}

const campos = {
    id_porcino: false,
    genero_porcino: false,
    fecha_nacimiento_porcino: false,
    id_corral: false

}

const ValidarForm = (e) => {
    let NombreCampo = e.target.name;
    console.log(NombreCampo);
    switch (NombreCampo) {
        case "id_porcino":
            console.log("id_porcino");
            validarCampo(expresiones.id, e.target, NombreCampo);
            break;
        case "genero_porcino":
            validarCampo(expresiones.genero, e.target, NombreCampo);
            break;
        case "fecha_nacimiento_porcino":
            console.log("Fecha");
            validarCampo(expresiones.fecha, e.target, NombreCampo);
            break;
        case "id_corral":
            console.log("Entro Ids");
            validarCampo(expresiones.id, e.target, NombreCampo);
            break;
        default:
            break;
    }
}

const validarCampo = (expre, input, campo) => {
    console.log("Hola")
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
    console.log("Holaa");
    Option.addEventListener('blur', ValidarForm);
});


function MiFuncion() {
    if (campos.id_porcino && campos.genero_porcino && campos.fecha_nacimiento_porcino && campos.id_corral) {
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
