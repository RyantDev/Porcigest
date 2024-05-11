const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('#formulario input');

const expresiones = {
    id: /^[^a-zA-Z]{1,20}$/, // No mas de 20 Digitos.
    cedula:  /^(?=\s*\S)(\d{8}(\d{2})?)?$/, // Cedula de 0 a maximo 10 digitos.
}

const campos = {
    id_lote: false,
    id_corral: false,
    cedula_propietario: false,
}

const ValidarForm = (e) => {
    let NombreCampo = e.target.name;
    console.log(NombreCampo);
    switch (NombreCampo) {
        case "id_lote":
            validarCampo(expresiones.id, e.target, NombreCampo);
            break;
        case "id_corral":
            validarCampo(expresiones.id, e.target, NombreCampo);
            break;
        case "cedula_propietario":
            validarCampo(expresiones.cedula, e.target, NombreCampo);
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
    console.log("Entro");
    if ((campos.id_lote && campos.id_corral) && campos.cedula_propietario) {
            console.log("Entro");
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



