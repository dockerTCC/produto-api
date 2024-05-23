package multiversa.edu.produtoapi.model.service;

import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import multiversa.edu.produtoapi.model.dto.ProdutoDTO;
import multiversa.edu.produtoapi.model.entity.Produto;
import multiversa.edu.produtoapi.model.repository.ProdutoRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Log
public class ProdutoServiceImpl implements ProdutoService{

    private final ProdutoRepository repository;

    @Override
    public Produto cadastrarNovoProduto(ProdutoDTO produtoDTO) {
        Produto produto = new Produto();
        BeanUtils.copyProperties(produtoDTO, produto);
        return repository.save(produto);
    }

    @Override
    public List<Produto> buscarTodos() {

        return repository.findAll();
    }

    @Override
    public void delete(Long id) {
        repository.deleteById(id);
    }

    @Override
    public void deleteAll() {
        repository.deleteAll();
    }

    @PostConstruct
    public void log(){
        log.info("Serviço atualizado");
    }
}
