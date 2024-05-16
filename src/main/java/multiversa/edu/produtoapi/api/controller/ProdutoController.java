package multiversa.edu.produtoapi.api.controller;


import lombok.RequiredArgsConstructor;
import multiversa.edu.produtoapi.model.dto.ProdutoDTO;
import multiversa.edu.produtoapi.model.entity.Produto;
import multiversa.edu.produtoapi.model.service.ProdutoService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("produto")
@RequiredArgsConstructor
public class ProdutoController {

    private final ProdutoService service;

    @PostMapping("cadastrar")
    public ResponseEntity<Produto> cadastrar(@RequestBody ProdutoDTO produtoDTO){
        Produto produto = service.cadastrarNovoProduto(produtoDTO);
        return ResponseEntity.ok(produto);
    }

    @DeleteMapping("excluir/{id}")
    public String excluir(@PathVariable Long id){
        service.delete(id);
        return "Excluido com sucesso!";
    }

    @GetMapping
    public List<Produto> buscarTodos(){
        return service.buscarTodos();
    }

}
