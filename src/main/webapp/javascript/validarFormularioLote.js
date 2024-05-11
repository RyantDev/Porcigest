
const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('#formulario input');
const OptionSelected = document.querySelectorAll('#formulario select');
const expresiones = {
    id: /^[^a-zA-Z]{1,20}$/, // No mas de 20  Digitos
    raza: /^[a-zA-ZÀ-ÿ\s]{1,40}$/, // Letras y espacios, pueden llevar acentos.
    fecha: /^\d{4}-\d{2}-\d{2}$/,
    promedio: /^.{4,12}$/, // 4 a 12 digitos.
    cantidad: /^.{2}$/,
    corral: /^\d*$/

}

const campos = {
    id_lote: false,
    raza: false,
    fecha_nacimiento: false,
    promedio_peso: false,
    cantidad_camada: false,
    id_corral: false,
    id_reproduccion: false
}


const ValidarForm = (e) => {
    let NombreCampo = e.target.name;
    console.log(NombreCampo);
    switch (NombreCampo) {
        case "id_lote":
        case "id_reproduccion":
            validarCampo(expresiones.id, e.target, NombreCampo);
            break;
        case "raza":
            validarCampo(expresiones.raza, e.target, NombreCampo);
            break;
        case "fecha_nacimiento":
            validarCampo(expresiones.fecha, e.target, NombreCampo);
            break;
        case "promedio_peso":
            validarCampo(expresiones.promedio, e.target, NombreCampo);
            break;
        case "cantidad_camada":
            validarCampo(expresiones.cantidad, e.target, NombreCampo);
            break;
        case "id_corral":
            validarCampo(expresiones.corral, e.target, NombreCampo);
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
    if (campos.id_lote && campos.id_reproduccion && campos.fecha_nacimiento && campos.raza && campos.promedio_peso && campos.cantidad_camada && campos.id_corral) {
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

