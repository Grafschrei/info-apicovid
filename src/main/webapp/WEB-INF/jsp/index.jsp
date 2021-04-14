<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" href="css/estilosAdmi.css">
        <link rel="stylesheet" type="text/css" href="../../css/Courgette-Regular.ttf">
        <link rel="stylesheet" href="../../font/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
        <title>Diagnóstico Covid - Vidco</title>
        <link rel="shortcut icon" type="image/png" href="/img/covidPage.png"/>
    </head>
    <body>
        <div id="container" class="container-fluid">
            <div class="row">

                <!--NAV LATERAL-->

                <div id="main-menu" class="col-md-2 mymain">
                    <div class="navbar-brand myimg">
                        <img src="img/covid-4948866_1920.jpg" width="300" height="200" class="img-fluid" alt=""> 
                    </div>
                    <ul class="nav nav-pills flex-column text-uppercase">                                          
                        <li class="nav-item">
                            <a class="nav-link text-dark mytext2" href=""><i class="fa fa-users text-dark mr-2" aria-hidden="true"></i>Clientes</a>
                        </li>
                    </ul>
                </div>

                <!--FIN-->

                <div id="right-content" class="col-md-10 bg-light text-dark">
                    <div class="row mynav">
                        <div id="top-menu" class="col-12 bg-dark text-light d-flex align-items-center justify-content-between">
                            <div id="btn-menu" class="pull-left">
                                <i class="fa fa-bars fa-2x" aria-hidden="true"></i>
                            </div>
                            <div id="btn-menu" class="pull-right">
                                <div class="dropdown show">
                                    <a class="btn btn-light dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-user" aria-hidden="true"></i>Administrador
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                        <a class="dropdown-item" href="#">Mi perfil</a>                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div id="content" class="col-12">
                            <h1 class="my-2 text-center">Lista de Usuarios Registrados | Vidco </h1>
                            <table id="tbl-usuarios" class="table table-responsive">
                                <thead class="bg-dark text-light">
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre</th>                                       
                                        <th>Documento</th>
                                        <th>Correo</th>
                                        <th>Telefono</th>                                        
                                        <th>Síntomas</th>
                                        <th>Diagnóstico</th>
                                    </tr>
                                </thead>
                                <tbody>
                                 <td></td>
                                    <td><i class="fa fa-heartbeat" aria-hidden="true"></i></td>                                                                   
                                </tbody>                                                           
                            </table> 
                        </div>
                    </div>
                </div>
            </div>
     
        <script src="../../js/jquery.min.js"></script>
        <script src="../../js/popper.js"></script>
        <script src="../../js/bootstrap.min.js"></script>
        <script src="js/scripts.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>    
        <script>
        var MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
        var color = Chart.helpers.color;
        var barChartData = {
            labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
            datasets: [{
                label: 'Dataset 1',
                backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
                borderColor: window.chartColors.red,
                borderWidth: 1,
                data: [
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor()
                ]
            }, {
                label: 'Dataset 2',
                backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
                borderColor: window.chartColors.blue,
                borderWidth: 1,
                data: [
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor()
                ]
            }]

        };

        window.onload = function() {
            var ctx = document.getElementById('canvas').getContext('2d');
            window.myBar = new Chart(ctx, {
                type: 'bar',
                data: barChartData,
                options: {
                    responsive: true,
                    legend: {
                        position: 'top',
                    },
                    title: {
                        display: true,
                        text: 'Chart.js Bar Chart'
                    }
                }
            });

        };

        document.getElementById('randomizeData').addEventListener('click', function() {
            var zero = Math.random() < 0.2 ? true : false;
            barChartData.datasets.forEach(function(dataset) {
                dataset.data = dataset.data.map(function() {
                    return zero ? 0.0 : randomScalingFactor();
                });

            });
            window.myBar.update();
        });

        var colorNames = Object.keys(window.chartColors);
        document.getElementById('addDataset').addEventListener('click', function() {
            var colorName = colorNames[barChartData.datasets.length % colorNames.length];
            var dsColor = window.chartColors[colorName];
            var newDataset = {
                label: 'Dataset ' + (barChartData.datasets.length + 1),
                backgroundColor: color(dsColor).alpha(0.5).rgbString(),
                borderColor: dsColor,
                borderWidth: 1,
                data: []
            };

            for (var index = 0; index < barChartData.labels.length; ++index) {
                newDataset.data.push(randomScalingFactor());
            }

            barChartData.datasets.push(newDataset);
            window.myBar.update();
        });

        document.getElementById('addData').addEventListener('click', function() {
            if (barChartData.datasets.length > 0) {
                var month = MONTHS[barChartData.labels.length % MONTHS.length];
                barChartData.labels.push(month);

                for (var index = 0; index < barChartData.datasets.length; ++index) {
                    // window.myBar.addData(randomScalingFactor(), index);
                    barChartData.datasets[index].data.push(randomScalingFactor());
                }

                window.myBar.update();
            }
        });

        document.getElementById('removeDataset').addEventListener('click', function() {
            barChartData.datasets.pop();
            window.myBar.update();
        });

        document.getElementById('removeData').addEventListener('click', function() {
            barChartData.labels.splice(-1, 1); // remove the label first

            barChartData.datasets.forEach(function(dataset) {
                dataset.data.pop();
            });

            window.myBar.update();
        });
    </script>     
    </body>
</html>
