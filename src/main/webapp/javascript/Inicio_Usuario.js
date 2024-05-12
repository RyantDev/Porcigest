document.addEventListener("DOMContentLoaded", function () {
    // Obtener elementos una vez que el DOM esté cargado
    var body = document.getElementById("body");
    var side_menu = document.getElementById("menu_side");
    var btn_open = document.getElementById("btn_open");

    // Evento para mostrar y ocultar menú
    function open_close_menu() {
        body.classList.toggle("body_move");
        side_menu.classList.toggle("menu__side_move");
    }

    // Asignar el evento click al botón
    btn_open.addEventListener("click", open_close_menu);
    // Función detectar

    function open_pestana(tab) {

        var pestanas_remove = document.querySelectorAll("tabs");

        for (let i = 0; i < pestanas_remove.length; i++) {
            pestanas_remove[i].style.display = "none";
        }
        document.getElementById(tab).style.display = "block";

    }

});
function detectar(id) {
    var selec = document.getElementById(id);
    var elementos = document.getElementsByClassName("eli");
    for (var i = 0; i < elementos.length; i++) {
        elementos[i].classList.remove("selected");
    }

    if (selec) {
        selec.classList.add("selected");

        //dos metodos que mostrara el nav correspondiente de la seleccion y otro que eliminara el contenido anterior
        mostrartab2(id);
        quitar_contenido();
    }
}

function quitar_contenido() {

    // Obtenemos todos los elementos de pestañas
    const tabContentss = document.querySelectorAll('.tab-content');

    // Iteramos sobre cada elemento de pestaña y quitamos la clase 'active'
    tabContentss.forEach(tabContentt => {
        tabContentt.classList.remove('active');

    });
}

function mostrartab2(id) {
    let noventa = document.getElementById("noventa");
    let cero = document.getElementById("tab0");
    let uno = document.getElementById("tab1");
    let dos = document.getElementById("tab2");
    let tres = document.getElementById("tab3");
    let cuatro = document.getElementById("tab4");
    let cinco = document.getElementById("tab5");
    let seis = document.getElementById("tab6"); 

    var lista = [cero, uno, dos, tres, cuatro, cinco, seis, noventa];

    for (let i = 0; i < lista.length; i++) {
        lista[i].style.display = "none";
    }

    if (id == 0) {
        cero.style.display = "block";
    } else if (id == 1) {
        uno.style.display = "block";
    } else if (id == 2) {
        dos.style.display = "block";
    } else if (id == 3) {
        tres.style.display = "block";
    } else if (id == 4) {
        cuatro.style.display = "block";
    } else if (id == 5) {
        cinco.style.display = "block";
    } else if (id == 6) {
        seis.style.display = "block";
    } else if (id == 99) {
        noventa.style.display = "block";
    }
}


function open_submenu() {
    let menus = document.getElementsByClassName("navbar");
    let elementos_id = document.getElementById("navbar_inicio");
    for (let i = 0; i < menus.length; i++) {
        menus[i].style.display = "none";
    }
}

function changeTab(tabIndex) {


    const tabContents = document.querySelectorAll('.tab-content');
    const tabButtons = document.querySelectorAll('.tab-button');
const quitar= document.getElementsByClassName("pestana");



 if (tabIndex===16) {
    quitar.style.display= "none";
    }
    
    
    tabContents.forEach((tabContent, index) => {
        if (index === tabIndex) {
            tabContent.classList.add('active');
        } else {
            tabContent.classList.remove('active');
        }
    });

    tabButtons.forEach((tabButton, index) => {
                   
        if (index === tabIndex) {
            tabButton.style.backgroundColor = '#1072d3';
        } else {
            tabButton.style.backgroundColor = '#000001';
        }
    });
}



