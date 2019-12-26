pragma solidity ^0.5.0;

/**
 * @title MedidorUnergy
 *
 * @dev este contrato registra las mediciones de energía y el hash del codigo del medidor en la Blockchain de Ethereum
 */
 contract MedidorUnergy {
    uint Array_Element;
    uint IDmedida=0;
 //__________________________________________________
 //Estructuras y Variables
// En primer lugar creamos una estructura para definir la información que vamos a cargar en cada medida
    struct medida {
       uint ID;                 //En cada medida vamos a relacionar el ID, que lleva el orden en el cual fueron subidas las medidas
       string hash_medidor;     //Vamos a subir el hash del medidor para identificar cambios en la integridad del medidor
       uint energia;          //Vamos a subir el ultimo valor de energía medido
       string tiempo;           //La medida de energía va acompañada de una estampa de tiempo
       address pk_medidor;      //Por ultimo vamos a relacionar la medida con la clave publica del medidor que la envio a la Blockchain
    }
    
    // Vamos a crear un listado de medidas para tener una trazabilidad total de todas las medidas enviadas desde todos los medidores
    medida[] public  medidas;
    
//__________________________________________________
//Mapeos
    //En esta sección vamos a definir unos mapeos que nos van a permitir relacionar información de las medidas con un medidor especifico
    mapping (address => uint) public pk2cuenta_medidas;     //En este mapeo vamos a llevar la cuenta de las medidas almacenadas por un medidor
    mapping (address => medida[]) public pk2medidas;        //En este mapeo vamos a relacionar la clave publica del medidor e iremos agregando a un listado las medidas enviadas por el mismo
//__________________________________________________
    //Funciones
    // En esta funcion vamos a permitir al medidor subir nuevas medidas al listado y a los mapeos
    function nueva_medida( string memory _hash_medidor, uint _energia, string memory _tiempo) public {     //Definimos el nombre de la funcion y los parametros de entrada, los cuales son todos los datos de la estructura, excepto la clave publica
        Array_Element  = (medidas.push(medida(IDmedida, _hash_medidor, _energia, _tiempo, msg.sender)));            //Subimos los datos ingresados en la función junto con la clave publica del medidor que hace el llamado a la misma
        pk2medidas[msg.sender].push(medida(IDmedida, _hash_medidor, _energia, _tiempo, msg.sender));                //Actualizamos el mapeo que guarda todas las medidas de un medidor
        pk2cuenta_medidas[msg.sender] ++;                                                                           //Actualizamos el mapeo de la cuenta de medidas almacenadas
        IDmedida++;                                                                                                 //Actualizamos la cuenta de todas las medidas almacenadas
    }
//En esta funcion habilitamos la consulta para verificar el total de medidas almacenadas por todos los medidores
    function longitud_medidas () public view returns (uint){  //Definimos la funcion publica  
        return medidas.length;      //Devolvemos el valor del tamaño del vector de medidas
    }
}

//FIN******************************************