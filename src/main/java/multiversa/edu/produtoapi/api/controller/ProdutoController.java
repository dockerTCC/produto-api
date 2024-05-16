package multiversa.edu.produtoapi.api.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import multiversa.edu.produtoapi.model.dto.ProdutoDTO;
import multiversa.edu.produtoapi.model.entity.Produto;
import multiversa.edu.produtoapi.model.service.ProdutoService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("produto")
@RequiredArgsConstructor
@Log
public class ProdutoController {

    private final ProdutoService service;

    @PostMapping("cadastrar")
    public void cadastrar(@RequestBody ProdutoDTO produtoDTO){
        service.cadastrarNovoProduto(produtoDTO);
    }

    @DeleteMapping("excluir/{id}")
    public void excluir(@PathVariable Long id){
        service.delete(id);
    }

    @DeleteMapping("excluir")
    public void excluirTodos(){
        service.deleteAll();
    }

    @GetMapping
    public List<Produto> buscarTodos(){
        return service.buscarTodos();
    }

}
