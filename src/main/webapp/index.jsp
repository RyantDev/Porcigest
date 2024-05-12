<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/delindex.css" rel="stylesheet" type="text/css"/>
            <link href="css/indexstilo.css" rel="stylesheet" type="text/css"/>
            <script>
    history.pushState(null, null, location.href);
    window.onpopstate = function () {
        history.go(1);
    };
</script>
            
    </head>

    <body>
        <header class="hero">
            <nav class="nav container">
                <div class="nav_logo">
                    <h2 class="nav__tittle">PORCI GEST</h2>
                </div>
                <ul class="nav__link nav__link--menu">
                    <li class="nav__items">
                        <a href="vistas/Login.jsp" class="nav__links">Iniciar sesión</a>
                    </li>
                    <img src="svg/close.svg" class="nav__close">
                </ul>
            </nav>
            <section class="hero__container container">
                <h1 class="hero__title">Conoce todo sobre nuestro software</h1>
            </section>
        </header>
    </body>

    <main>

        <section class="knowledge">
            <div class="knowledge__container container">
                <div class="knowledege__texts">
                    <h2 class="subtitle">Hacemos lo mejor para tu granja!</h2>
                    <p class="knowledge__paragraph">"Optimiza la gestión de tu granja porcina con nuestro software
                        especializado. Desde el seguimiento de la salud individual de cada cerdo hasta la planificación
                        eficiente de la alimentación, nuestro programa te proporciona herramientas intuitivas para maximizar
                        la productividad y asegurar el bienestar de tus animales. Con funciones de monitoreo en tiempo real
                        y análisis de datos, lleva tu granja de cerdos al siguiente nivel con nuestra solución tecnológica
                        líder en la industria."</p>

                </div>

                <figure class="knowledge__picture">
                    <img src="Imagenes/corral.jpg" class="knowledge__img">
                </figure>
            </div>
        </section>

        <section class="testimony">
            <div class="testimony__container container">
                <img src="svg/leftarrow.svg" class="testimony__arrow" id="before">

                <section class="testimony__body testimony__body--show" data-id="1">
                    <div class="testimony__texts">
                        <h2 class="subtitle">Mi nombre es Jose Maria, <span class="testimony__course">Usuario de PORCI
                                GEST.</span></h2>
                        <p class="testimony__review">"PORCI GEST ha revolucionado nuestra forma de gestionar la granja de
                            cerdos. La experiencia de usuario es excepcional, facilitando la monitorización diaria de la
                            salud de los cerdos, la planificación de la alimentación y la toma de decisiones estratégicas.
                            Este software ha sido clave para mejorar la eficiencia operativa y maximizar nuestros
                            resultados."</p>
                    </div>

                    <figure class="testimony__picture">
                        <img src="Imagenes/granjero1.jpg" class="testimony__img">
                    </figure>
                </section>

                <section class="testimony__body" data-id="2">
                    <div class="testimony__texts">
                        <h2 class="subtitle">Mi nombre es Alejandra Perez, <span class="testimony__course">Usuaria de PORCI
                                GEST</span></h2>
                        <p class="testimony__review">"Con PORCI GEST, encontramos una solución integral para la gestión de
                            nuestra granja porcina. No solo ofrece un seguimiento detallado de la salud y el crecimiento de
                            los cerdos, sino que también simplifica tareas administrativas. Es una herramienta completa que
                            ha elevado nuestra productividad a nuevos niveles."</p>
                    </div>
                    <figure class="testimony__picture">
                        <img src="Imagenes/granjera4.jpg" class="testimony__img">
                    </figure>
                </section>

                <section class="testimony__body" data-id="3">
                    <div class="testimony__texts">
                        <h2 class="subtitle">Mi nombre es Karen Arteaga, <span class="testimony__course">Usuaria de PORCI
                                GEST</span></h2>
                        <p class="testimony__review">"Lo que realmente destaca de PORCI GEST es su equipo de soporte
                            técnico. En cada paso del proceso de implementación, hemos recibido un apoyo excepcional. La
                            atención personalizada y la disposición para resolver cualquier problema han hecho que nuestra
                            transición al software sea suave y exitosa. ¡Altamente satisfechos con el servicio!"</p>
                    </div>

                    <figure class="testimony__picture">
                        <img src="Imagenes/granjera2.jpg" class="testimony__img">
                    </figure>
                </section>

                <section class="testimony__body" data-id="4">
                    <div class="testimony__texts">
                        <h2 class="subtitle">Mi nombre es Kevin Ramirez, <span class="testimony__course">Usuario de PORCI
                                GEST.</span></h2>
                        <p class="testimony__review">"Desde que implementamos PORCI GEST en nuestra granja porcina, hemos
                            experimentado una notable mejora en la eficiencia y la gestión general. La plataforma intuitiva
                            nos ha permitido monitorear de cerca la salud de cada cerdo, optimizar la alimentación de manera
                            precisa y tomar decisiones informadas gracias a su seguimiento en tiempo real de las condiciones
                            ambientales. La facilidad de uso y las robustas funcionalidades hacen de PORCI GEST una
                            herramienta imprescindible para cualquier granjero que busque mejorar la productividad y el
                            bienestar animal. ¡Altamente recomendado!"</p>
                    </div>

                    <figure class="testimony__picture">
                        <img src="Imagenes/granjero3.jpg" class="testimony__img">
                    </figure>
                </section>


                <img src="svg/rightarrow.svg" class="testimony__arrow" id="next">
            </div>
        </section>

        <section class="questions container">
            <h2 class="subtitle">Preguntas frecuentes</h2>
            <p class="questions__paragraph">Acá podrás encontrar sobre las preguntas frecuentes sobre PORCI GEST.</p>

            <section class="questions__container">
                <article class="questions__padding">
                    <div class="questions__answer">
                        <h3 class="questions__title">¿Qué hace a PORCI GEST único para la gestión de granjas porcinas?
                            <span class="questions__arrow">
                                <img src="svg/arrow.svg" class="questions__img">
                            </span>
                        </h3>

                        <p class="questions__show">PORCI GEST destaca por su enfoque integral, que abarca desde el
                            seguimiento individual de la salud de los cerdos hasta la optimización de la alimentación y el
                            monitoreo en tiempo real de las condiciones ambientales. Su interfaz intuitiva y robustas
                            funcionalidades hacen que sea la elección ideal para mejorar la eficiencia operativa y el
                            bienestar animal.</p>
                    </div>
                </article>

                <article class="questions__padding">
                    <div class="questions__answer">
                        <h3 class="questions__title">¿Cómo ayuda PORCI GEST en la toma de decisiones estratégicas?
                            <span class="questions__arrow">
                                <img src="svg/arrow.svg" class="questions__img">
                            </span>
                        </h3>

                        <p class="questions__show">El software proporciona datos detallados y precisos sobre diversos
                            aspectos de la granja, permitiendo a los usuarios tomar decisiones informadas. Ya sea ajustando
                            la dieta de los cerdos o adaptándose a las condiciones ambientales cambiantes, PORCI GEST brinda
                            la información necesaria para optimizar las estrategias operativas.</p>
                    </div>
                </article>

                <article class="questions__padding">
                    <div class="questions__answer">
                        <h3 class="questions__title">¿Cuál es el nivel de soporte técnico proporcionado con PORCI GEST?
                            <span class="questions__arrow">
                                <img src="svg/arrow.svg" class="questions__img">
                            </span>
                        </h3>
                        <p class="questions__show">Nuestro equipo de soporte técnico está dedicado a garantizar una
                            experiencia sin problemas. Desde la implementación hasta el uso diario, estamos comprometidos
                            con brindar asistencia excepcional. Puedes confiar en nosotros para resolver cualquier pregunta
                            o problema de manera rápida y eficiente.</p>
                    </div>
                </article>
            </section>
            <section class="questions__offer">
                <h2 class="subtitle">¿Qué esperas para optimizar hoy la gestión de tu granja porcina con PORCI GEST?</h2>
                <p class="questions__copy">Nuestra plataforma integral ofrece un enfoque completo y eficiente para el
                    seguimiento de la salud de los cerdos, la planificación de la alimentación y el monitoreo en tiempo
                    real. Mejora la eficiencia operativa y garantiza el bienestar animal con nuestras robustas
                    funcionalidades.</p>
                <a href="#" class="cta">Obtener Ahora</a>
            </section>
        </section>
    </main>
    <footer class="footer">
        <section class="footer__container container">
            <nav class="nav nav--footer">
                <h2 class="footer__title">PORCI GEST</h2>

                <ul class="nav__link nav__link--footer">
                    <li class="nav__items">
                        <a href="#" class="nav__links">Iniciar sesión</a>
                    </li>
                    <li class="nav__items">
                        <a href="#" class="nav__links">Inicio</a>
                    </li>
                    <li class="nav__items">
                        <a href="#" class="nav__links">Acerca de</a>
                    </li>
                    <li class="nav__items">
                        <a href="#" class="nav__links">Contacto</a>
                    </li>
                    <li class="nav__items">
                        <a href="#" class="nav__links">Blog</a>
                    </li>
                </ul>
            </nav>
            <form class="footer__form" action="https://formspree.io/f/mknkkrkj" method="POST">
                <h2 class="footer__newsletter">Suscribete a nuestras noticias</h2>
                <div class="footer__inputs">
                    <input type="email" placeholder="Email:" class="footer__input" name="_replyto">
                    <input type="submit" value="Registrate" class="footer__submit">
                </div>
            </form>
        </section>
        <section class="footer__copy container">
            <div class="footer__social">
                <a href="#" class="footer__icons"><img src="svg/facebook.svg" class="footer__img"></a>
                <a href="#" class="footer__icons"><img src="svg/github.svg" class="footer__img"></a>
                <a href="#" class="footer__icons"><img src="svg/gmail.svg" class="footer__img"></a>
            </div>

            <h3 class="footer__copyright">Derechos reservados &copy; SENA</h3>
        </section>
    </footer>

    <script src="javascript/slider.js" type="text/javascript"></script>
    <script src="javascript/questions.js" type="text/javascript"></script>
    <script src="javascript/menu.js" type="text/javascript"></script>
</body>
</html>
