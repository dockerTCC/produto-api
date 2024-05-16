package multiversa.edu.produtoapi.model.dto;


import java.math.BigDecimal;

public record ProdutoDTO(
        String nome,
        BigDecimal valor
        ) {
}
