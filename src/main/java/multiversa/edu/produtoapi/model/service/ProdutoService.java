package multiversa.edu.produtoapi.model.service;

import multiversa.edu.produtoapi.model.dto.ProdutoDTO;
import multiversa.edu.produtoapi.model.entity.Produto;

import java.util.List;

public interface ProdutoService {

    Produto cadastrarNovoProduto(ProdutoDTO produtoDTO);
    List<Produto> buscarTodos();
    void delete(Long id);
    void deleteAll();
}
