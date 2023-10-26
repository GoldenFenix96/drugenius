//agregacion de generalidades
// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, library_private_types_in_public_api

import 'package:flutter/material.dart';



class generalidades extends StatefulWidget {
  const generalidades({Key? key}) : super(key: key);
  @override
  State<generalidades> createState() => _generalidadesState();
}

class _generalidadesState extends State<generalidades> {
  int _selectedPageIndex = 0;
  final List<Widget> _pages = [
    paginaIntrodFarmacologia(),
    paginaFARMACODINAMIA(),
    paginaFARMACOCINETICA(),
    paginaCUADROSBASICOS(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 207, 187, 4),
        title: Text('Generalidades'),
        actions: <Widget>[
          PopupMenuButton<int>(
            onSelected: (int index) {
              setState(() {
                _selectedPageIndex = index;
              });
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<int>>[
                PopupMenuItem<int>(
                  value: 0,
                  child: Text('Introducción a la farmacología'),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text('Farmacodinamia'),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Text('Farmacocinética'),
                ),
                PopupMenuItem<int>(
                  value: 3,
                  child: Text('Cuadros básicos'),
                ),
              ];
            },
          ),
        ],
      ),
      body: _pages[_selectedPageIndex],
    );
  }
}

class paginaIntrodFarmacologia extends StatelessWidget {
  const paginaIntrodFarmacologia({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
            child: Center(
          child: Text(
            'INTRODUCCIÓN A LA FARMACOLOGÍA',
            style: TextStyle(
              fontSize: 18, // Tamaño de fuente
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0, 0), // Color del texto
            ),
          ),
        )),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Text(
                    "La farmacología está llena de descubrimientos accidentales y es producto de investigaciones destacadas. La historia de esta ciencia empieza desde el consumo de las plantas para aliviar malestares o para ser conocidos y explotados por los humanos. Unos de los ejemplos más comunes es el curare, el cual fue empleado por los indios sudamericanos para impregnarlo en la punta de sus flechas y hacer de la caza más fácil, ya que paralizaba y mataba los animales para alimentarse; y el juego de la amapola (opio) que contiene morfina (del griego Morpheus, el dios de los sueños) para aliviar el dolor y controlar la disentería.",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Wrap(
                    children: [
                      Image.asset('assets/images/img1.jpeg',
                          width: 100,
                          height:
                              100), // Cambia las dimensiones según tus necesidades
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Por lo tanto, los primeros fármacos provenían de la observación de los efectos de las plantas después de ser ingeridas por los animales, ya que aún no se conocían el mecanismo o el sitio de acción."
                          "Actualmente, los fármacos se basan en el cribado de alto rendimiento de sustancias químicas que contienen millones de compuestos que se identifican por su capacidad para interactuar con un blanco específico o provocar una respuesta biológica específica.",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "La FDA (Food and Drug Administration) es la agencia reguladora responsable de proteger la salud pública, al garantizar la seguridad, eficacia y seguridad de los fármacos para uso en los humanos o para "
                            "uso veterinario, productos biológicos, dispositivos médicos, alimentos, cosméticos y productos que emiten radiación. Por ende, el sacar un fármaco al mercado no es"
                            "nada sencillo, ya que pasan por diversas pruebas, es decir, pueden competir desde 10,000 a 25,000 entidades químicas, pero solo 1 puedo lograr el registro de la patente.",
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.justify),
                      ),
                      Image.asset('assets/images/img2.jpeg',
                          width: 100,
                          height:
                              100), // Cambia las dimensiones según tus necesidades
                    ],
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Text(
                    "-	Blanco: Es el receptor o sitio de acción de un fármaco.\n"
                    "-	Patente: Es el medicamento que resulta de un proceso de investigación y que está protegido por la patente. Normalmente, estos fármacos suelen tener precios muy elevados (Ej. 8mil pesos).\n"
                    "-	Genérico: Son fármacos que se ha demostrado que son intercambiables con los patentes, es decir, que tienen el mismo efecto dentro del organismo y suelen ser más baratos que los patentes (Ej. 100 pesos)\n"
                    "-	Similares: Son los productos copia que no han pasado por ninguna prueba de intercambiabilidad, por lo que su biodisponibilidad (comportamiento dentro del organismo) puede variar y no tener la misma eficacia que tiene un fármaco genérico o patente. Su precio suele ser bajo a comparación con los dos anteriores (Ej. 15 pesos).",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                child: Text(
                  "Bibliografía consultada",
                  style: TextStyle(
                    fontSize: 25, // Tamaño de fuente
                    fontWeight: FontWeight.bold,
                    color:
                        const Color.fromARGB(255, 0, 0, 0), // Color del texto
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Text(
                    "•	Ledón Pérez, L. E., & Hernández Pérez, A. (2013). Farmacología general.\n"
                    "Una guía de estudio (1.a ed.). MCGRAW-HILL EDUCATION.\n\n"
                    "•	Brunton, L. L., & Knollman, B. C. (2018). Goodman y Gilman. Las bases\n"
                    "farmacológicas de la terapéutica (13.a ed.). MCGRAW-HILL EDUCATION",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class paginaFARMACODINAMIA extends StatelessWidget {
  const paginaFARMACODINAMIA({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
            child: Center(
          child: Text(
            'FARMACODINAMIA',
            style: TextStyle(
              fontSize: 18, // Tamaño de fuente
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0, 0), // Color del texto
            ),
          ),
        )),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Text(
                    "La farmacodinamia es el estudio de los efectos bioquímicos, celulares y fisiológicos de los fármacos y sus mecanismos de acción. Los efectos de la mayoría de los fármacos son el resultado de su interacción con los componentes macromoleculares del organismo, como los receptores.  \n",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Wrap(
                    children: [
                      Image.asset('assets/images/img3.jpeg',
                          width: 100,
                          height:
                              100), // Cambia las dimensiones según tus necesidades
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Es por esto por lo que el término receptor de fármaco o blanco de fármaco se refiere a la macromolécula celular o el complejo macromolecular con el cual el fármaco interactúa para obtener una respuesta celular o sistémica."
                            "Los receptores de fármacos a menudo se localizan en la superficie de las células, pero también pueden ubicarse en compartimentos intracelulares específicos como el núcleo, o en el compartimento extracelular.",
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.justify),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          "Los receptores fisiológicos son proteínas que normalmente sirven como receptores para ligandos reguladores endógenos, es decir, son los que son blancos de reguladores propios del cuerpo humano, pero que también son utilizados por las sustancias sintéticas o fármacos. ",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      child: Center(
                        child: Wrap(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "•	Agonistas. Son los fármacos que se unen a los receptores fisiológicos e imitan a los efectos reguladores de los compuestos de señalización endógenos. \n\n"
                                  "  -	Agonista primario. El fármaco se une al mismo sitio de reconocimiento que el agonista endógeno. \n"
                                  "  -	Agonista alostérico (alotrópico). Es el fármaco que une a una región diferente del receptor, denominada sitio alostérico o alotrópico.\n"
                                  "  -	Agonista parcial. Es aquel es sólo parcialmente efectivo como agonista.\n"
                                  "  -	Agonista inverso. Es el fármaco que estabiliza o inactiva a ciertos receptores que generan alguna actividad constitutiva aun cuando no tienen un ligando regulador\n\n",
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.justify),
                            ),
                            Image.asset('assets/images/img4.jpeg',
                                width: 100,
                                height:
                                    100), // Cambia las dimensiones según tus necesidades
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      child: Center(
                        child: Wrap(
                          children: [
                            Image.asset('assets/images/img5.jpeg',
                                width: 100,
                                height:
                                    100), // Cambia las dimensiones según tus necesidades
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "•	Antagonistas. Son los fármacos que bloquean o reducen la acción de un agonista.\n\n"
                                  "  -	Antagonista competitivo. Compite con un agonista por el mismo sitio o superposición en el receptor.\n"
                                  "  -	Antagonista alostérico. Interacciona con otros sitios del receptor.\n"
                                  "  -	Antagonista químico. Se combina con el agonista.\n"
                                  "  -	Antagonista funcional. Inhibición indirectamente los efectos celulares o fisiológicos del agonista.\n",
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.justify),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                child: Text(
                  "Bibliografía consultada",
                  style: TextStyle(
                    fontSize: 25, // Tamaño de fuente
                    fontWeight: FontWeight.bold,
                    color:
                        const Color.fromARGB(255, 0, 0, 0), // Color del texto
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Text(
                    "•	Brunton, L. L., & Knollman, B. C. (2018). Goodman y Gilman.\n"
                    "Las bases farmacológicas de la terapéutica (13.a ed.). MCGRAW-HILL EDUCATION ",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class paginaFARMACOCINETICA extends StatelessWidget {
  const paginaFARMACOCINETICA({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
            child: Center(
          child: Text(
            'FARMACOCINÉTICA',
            style: TextStyle(
              fontSize: 18, // Tamaño de fuente
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0, 0), // Color del texto
            ),
            textAlign: TextAlign.justify,
          ),
        )),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Text(
                    "La farmacocinética se encarga de estudiar los procesos a los cuales es sometido un fármaco dentro del organismo, a través de todo su paso en el interior, y hasta el exterior de este, es decir, desde el momento en el que un fármaco es administrado hasta su total eliminación del organismo.\n\n"
                    "La liberación, absorción, distribución, metabolismo y eliminación (LADME) de los fármacos, son los procesos básicos de la farmacocinética:\n\n"
                    "•	Liberación: Una vez ingerido el medicamento, se libera de la forma farmacéutica de la que forma parte y posteriormente se disuelve en el medio.\n\n"
                    "•	Absorción: Después de ser disuelto, el fármaco avanza por el organismo para ser absorbido principalmente por el intestino delgado y posteriormente el paso del fármaco a la sangre.\n\n"
                    "•	Distribución: Tras su acceso en el torrente sanguíneo, el fármaco debe viajar hasta el lugar de acción del mismo.\n\n"
                    "•	Metabolismo: Ocurre principalmente en el hígado, y busca transformar químicamente el fármaco en un compuesto más fácil de eliminar.\n\n"
                    "•	Eliminación: El fármaco es eliminado del organismo mediante los mecanismos de excreción tras ser metabolizado, principalmente por vía urinaria y/o biliar.\n\n",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Wrap(
                    children: [
                      Image.asset('assets/images/img6.jpeg',
                          width: 100,
                          height:
                              100), // Cambia las dimensiones según tus necesidades
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                            "El cuerpo humano restringe el acceso a moléculas extrañas; por tanto, para alcanzar su blanco dentro del cuerpo y tener un efecto terapéutico, las moléculas del fármaco deben cruzar una serie de barreras que condicionan el camino hacia su sitio blanco.\n\n"
                            "La comprensión de estos procesos y su interacción, así como el empleo de los principios farmacocinéticos incrementan la probabilidad del éxito terapéutico y reducen la aparición de eventos adversos debidos a los fármacos. \n\n",
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.justify),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                child: Text(
                  "Bibliografía consultada",
                  style: TextStyle(
                    fontSize: 25, // Tamaño de fuente
                    fontWeight: FontWeight.bold,
                    color:
                        const Color.fromARGB(255, 0, 0, 0), // Color del texto
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Text(
                    "•	Gómez, V. V. (2016). LADME, el viaje del fármaco por el organismo.\nCanal Biosanitario. https://www.inesem.es/revistadigital/biosanitario/ladme-el-viaje-del-farmaco-por-el-organismo/ \n\n"
                    "•	Brunton, L. L., & Knollman, B. C. (2018). Goodman y Gilman. Las bases farmacológicas de la terapéutica \n(13.a ed.). MCGRAW-HILL EDUCATION",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class paginaCUADROSBASICOS extends StatelessWidget {
  const paginaCUADROSBASICOS({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
            child: Center(
          child: Text(
            'CUADROS BÁSICOS Y LISTAS DE MEDICAMENTOS ESENCIALES',
            style: TextStyle(
              fontSize: 18, // Tamaño de fuente
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0, 0), // Color del texto
            ),
            textAlign: TextAlign.center,
          ),
        )),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                            "•	Cuadro Básico de Medicamentos del IMSS (México, 2018) El Cuadro Básico de Medicamentos es el documento que agrupa los fármacos que se pueden prescribir en el Instituto, de acuerdo con la indicación autorizada por el Consejo de Salubridad General; en el puedes consultar las claves, descripción, indicación, vía de administración, dosis, generalidades, efectos adversos, contraindicaciones, precauciones y riesgo durante el embarazo. IMSS",
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.justify),
                      ),
                      Image.asset('assets/images/img7.jpeg',
                          width: 100,
                          height:
                              100), // Cambia las dimensiones según tus necesidades
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Text(
                    "•	Lista Modelo de Medicamentos Esenciales (OMS, 2021) Los medicamentos incluidos en las Listas Modelo de Medicamentos Esenciales buscan provocar un gran impacto en la salud pública mundial, sin poner en peligro los presupuestos de salud de los países de bajos y medianos ingresos. La selección de un número limitado de medicamentos esenciales marcados como tales, teniendo en cuenta la carga de morbilidad nacional y la necesidad clínica, puede conducir a un mejor acceso a través de la adquisición y distribución simplificadas de medicamentos de calidad garantizada, respaldar una prescripción y un uso más racionales o apropiados y costos más bajos tanto para la salud como para la salud, sistemas de atención y para los pacientes. OMS.\n\n"
                    "•	Listado de Medicamentos Estratégicos (España, 2022) La Agencia Española de Medicamentos y Productos Sanitarios (AEMPS) es la encargada de publicar el Listado de Medicamentos estratégicos para el sistema sanitario nacional, además de la metodología utilizada para su identificación y caracterización. El listado de medicamentos estratégicos es un listado dinámico. Tras su primera publicación en mayo de 2022 se ha actualizado en dos ocasiones y se irá actualizando tras el análisis de otros grupos de medicamentos autorizados, así como de forma prospectiva conforme se vayan produciendo cambios por la entrada o salida de medicamentos. \n\n",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Wrap(
                    children: [
                      Image.asset('assets/images/img8.jpeg',
                          width: 100, height: 100),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                            "•	Guía de Medicamentos de la FDA (Estados Unidos) Estas son parte del etiquetado de medicamentos recetados aprobados por la FDA para ciertos medicamentos recetados cuando la FDA determina que el etiquetado podría ayudar a prevenir reacciones adversas graves, además de informar a los pacientes sobre los efectos adversos y hacer hincapié en que el cumplimiento por parte del paciente de las instrucciones de uso es crucial para la eficacia del fármaco. Si no se encuentra la Guía de algún medicamento en específico significa que no ha sido aprobado por la FDA. \n\n",
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.justify),
                      ),
                      // Cambia las dimensiones según tus necesidades
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                child: Text(
                  "AINES",
                  style: TextStyle(
                    fontSize: 25, // Tamaño de fuente
                    fontWeight: FontWeight.bold,
                    color:
                        const Color.fromARGB(255, 0, 0, 0), // Color del texto
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Table(
              border: TableBorder.all(), // Borde de la tabla
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Center(
                        child: Text('Farmaco'),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          "Cuadro básico\nde\nmedicamentos\ndel IMSS\n(México, 2018)",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          "Listas\nModelos de\nMedicamentos\nEsenciales\n(OMS, 2021)",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          "Listado de\nMedicamentos\nEstratégicos\n(España, 2022)",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          "Guía de\nmedicamentos\nde la FDA\n(Estados Unidos)",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Center(
                        child: Text(
                          "Ácido\nacetilsalicílico ",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          '.',
                          style: TextStyle(
                              fontSize: 22, // Tamaño de fuente
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          '.',
                          style: TextStyle(
                              fontSize: 22, // Tamaño de fuente
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(''),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          '.',
                          style: TextStyle(
                              fontSize: 22, // Tamaño de fuente
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Center(
                        child: Text(
                          "Diclofenaco",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          '.',
                          style: TextStyle(
                              fontSize: 22, // Tamaño de fuente
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(''),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(''),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          '.',
                          style: TextStyle(
                              fontSize: 22, // Tamaño de fuente
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Center(
                        child: Text(
                          'Paracetamol',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          '.',
                          style: TextStyle(
                              fontSize: 22, // Tamaño de fuente
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          '.',
                          style: TextStyle(
                              fontSize: 22, // Tamaño de fuente
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(''),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          '.',
                          style: TextStyle(
                              fontSize: 22, // Tamaño de fuente
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Center(
                        child: Text(
                          'Naproxeno',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          '.',
                          style: TextStyle(
                              fontSize: 22, // Tamaño de fuente
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(""),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(''),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          '.',
                          style: TextStyle(
                              fontSize: 22, // Tamaño de fuente
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                child: Text(
                  "Bibliografía consultada",
                  style: TextStyle(
                    fontSize: 25, // Tamaño de fuente
                    fontWeight: FontWeight.bold,
                    color:
                        const Color.fromARGB(255, 0, 0, 0), // Color del texto
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Text(
                    "•	AEMPS. (2022, May 10). Medicamentos\nestratégicos.www.aemps.gob.es. https://www.aemps.gob.es/medicamentos-de-uso-humano/medicamentos-estrategicos/ \n\n" +
                        "•	IMSS. (2018). Cuadro Básico de Medicamentos. http://www.imss.gob.mx/sites/all/statics/pdf/cuadros-basicos/CBM.pdf\n\n" +
                        "•	OMS. (2021). EML-Electronic Essential Medicines List. Essentialmeds.org. https://list.essentialmeds.org/\n\n" +
                        "U. S FOOD AND DRUGS ADMINISTRATION. Medication Guides. Bases de Datos de Medicamentos. Retrieved from https://www.accessdata.fda.gov/scripts/cder/daf/index.cfm?event=medguide.page&utm_campaign=SBIA%3A%20FDA%20Launches%20New%20Medication%20Guide%20Database&utm_medium=email&utm_source=Eloqua ",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
