function abrir_ventana(id) {

    let agregar = document.getElementById('agregar');
    let editar = document.getElementById('editar');
    let eliminar = document.getElementById('eliminar');
    if (id == 'btnAgregar') {
        agregar.showModal();
    }
    if (id == 'btnEditar') {
        editar.showModal();
    }
    if (id == 'btnEliminar') {
        eliminar.showModal();
    }
}
function cerra_ventana() {
    let agregar = document.getElementById('agregar');
    let editar = document.getElementById('editar');
    let eliminar = document.getElementById('eliminar');
    agregar.close();
    editar.close();
    eliminar.close();
    Console.log("aaaaaaaa");
     window.location.reload();
    
}




