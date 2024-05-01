package multiversa.edu.produtoapi.model.repository;

import multiversa.edu.produtoapi.model.entity.Produto;
import org.springframework.data.jpa.repository.JpaRepository;

import java.math.BigDecimal;

public interface ProdutoRepository extends JpaRepository<Produto, Long> {

    void findAllByValorAndNomeContaining(BigDecimal valor, String nome);

    void deleteByNomeContaining(String nome);
}
