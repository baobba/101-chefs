<!DOCTYPE html>
<html>
    <head>
        <title>Add Custom GMap Markers - Map Markers | Rafael Clares</title>
        <script src="http://code.jquery.com/jquery-1.7.1.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false"></script>
        <link href="css/main.css" rel="stylesheet" />
    </head>
    <body>
		
        <div class="container_12">
            <div class="grid_12">
                <p class="alert alert-info"><i class="icon-search"></i> Adicionar Marcadores Personalizados</p>
            </div>
            <div class="grid_12">
                <div class="map" id="map" style="height: 300px; width: 100%;"></div>
            </div>
            <div class="grid_12">
                <br />
                <pre>
<strong>Exemplo de Uso com CEP:</strong>            
            $(function(){
               //Definir o centro do mapa [cep  + num + elm div]
               initMapCep('08615-000','555','map');
               //Adicionar marcadores  [cep + num + descricao html)
               addMarkerCep('08615-000','555','Local X');
               addMarkerCep('08616-000','100','Local Y');
            })

<strong>Exemplo de Uso com Endereço:</strong>  
            $(function(){
               initMap('Av. Paulista, 500, São Paulo, SP','map');
               addMarker('Rua Augusta, 700, São Paulo, SP','Local X');
               addMarker('Al. Franca, 278, São Paulo, SP','Local Y');
            })
                </pre>
            </div>


            <div class="grid_10">
                <div class="grid_4 push_4">
                    <br />
                    <a class="btn btn-info" href="marker.rar"><i class="icon-fire icon-white"></i> Download Map Markers</a>
                    <br />
                    <br />
                    <br />
                    <br />
                </div>
            </div>
			
        <script src="js/gmaps.js" type="text/javascript"></script>
        <script src="js/markers.js" type="text/javascript"></script>		
        <script>
            $(function(){
               //Definir o centro do mapa [endereço + elm div]
               initMap('Av. Paulista, 500, São Paulo, SP','map');
               //Adicionar marcadores  [endereço + descricao html)
               addMarker('Al. Itu, 700, São Paulo, SP','Local X');
               addMarker('Al. Franca, 278, São Paulo, SP','Local Y');
               addMarker('Av. Paulista, 500, São Paulo - SP','Local Z');
            })
        </script>
		
    </body>
</html>