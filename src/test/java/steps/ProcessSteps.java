package steps;

import cucumber.api.PendingException;
import cucumber.api.java.pt.*;
import definition.Process;
import groovy.json.internal.LazyMap;
import org.junit.Assert;
import support.RESTSupport;

public class ProcessSteps {
    @Dado("^que o usuário deseja salvar um novo processo$")
    public void queOUsuárioDesejaSalvarUmNovoProcesso() {
        Process.limparCampos();
    }

    @E("^o usuário informar no campo \"([^\"]*)\" o valor \"([^\"]*)\"$")
    public void oUsuárioInformarNoCampoOValor(String field, String value) throws Throwable {
       Process.preencherCampo(field, value);
    }

    @Quando("^o usuário clicar em salvar$")
    public void oUsuárioClicarEmSalvar() {
        RESTSupport.executePost(Process.getEndpoint(), Process.getCampos());
        Process.setId(RESTSupport.key("id").toString());
    }

    @E("^o usuário ver a mensagem \"([^\"]*)\"$")
    @Então("^o usuário deveria ver a mensagem \"([^\"]*)\"$")
    public void oUsuárioDeveriaVerAMensagem(String message) throws Throwable {
       LazyMap responses = new LazyMap();
       responses.put("Processo cadastrado com sucesso", 201);
       responses.put("Processo consultado com sucesso", 200);
       responses.put("Processo alterado com sucesso", 200);
       responses.put("Sem conteúdo", 204);
       responses.put("Não Encontrado", 404);

        Assert.assertEquals(responses.get(message), RESTSupport.getResponseCode());
    }

    @E("^o usuário clicar no botão salvar$")
    public void oUsuárioClicarNoBotãoSalvar() {
        RESTSupport.executePost(Process.getEndpoint(), Process.getCampos());
        Process.setId(RESTSupport.key("id").toString());
    }

    @Quando("^o usuário clicar no botão consultar do cadastro$")
    public void oUsuarioClicarNoBotãoConsultarDoCadastro() {
        RESTSupport.executeGet(Process.getEndpointConsulta());
    }

    @Entao("^o usuário deverá ver no campo \"([^\"]*)\" o valor \"([^\"]*)\"$")
    public void oUsuarioDeveráVerNoCampoOValor(String field, String value) throws Throwable {
        String atual = RESTSupport.key(field).toString();
        Assert.assertEquals(value, atual);
    }
//
//    @E("^o usuário ver a mensagem \"([^\"]*)\"$")
//    public void oUsuárioVerAMensagem(String message) throws Throwable {
//        LazyMap responses = new LazyMap();
//        responses.put("Processo cadastrado com sucesso", 201);
//
//        Assert.assertEquals(responses.get(message), RESTSupport.getResponseCode());
//    }
//
    @Quando("^o usuário clicar no botão editar$")
    public void oUsuárioClicarNoBotãoEditar() {
        RESTSupport.executePut(Process.getEndpoint()+'/'+Process.getId(), Process.getCampos());
        Process.setId(RESTSupport.key("id").toString());

    }

    @Quando("^o usuário clicar no botão apagar no cadastro$")
    public void oUsuárioClicarNoBotãoApagarNoCadastro() {
        RESTSupport.executeDelete(Process.getEndpoint() + '/' + Process.getId());
    }

    @E("^o usuário alterou o campo \"([^\"]*)\" para o valor \"([^\"]*)\"$")
    public void oUsuarioAlterouOCampoParaOValor(String campo, String valor) {
        Process.preencherCampo(campo,valor);

    }
}
