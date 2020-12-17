package definition;

import groovy.json.internal.LazyMap;

public class Process {
    private static LazyMap camposJson = new LazyMap();
    private static final String URL = "http://agapito-server.herokuapp.com/processos";
    private static String idUsuario;


    public static void limparCampos(){
        camposJson.clear();
    }

    public static void preencherCampo(String campo, String valor){
        camposJson.put(campo, valor);
    }


    public static String getEndpoint() {
        return URL;
    }

    public static LazyMap getCampos() {
        return camposJson;
    }

    public static String getEndpointConsulta() {
        return URL+"/"+idUsuario;
    }

    public static void setId(String id){
        idUsuario = id;
    }
    public static String getId(){
        return idUsuario;
    }

}
