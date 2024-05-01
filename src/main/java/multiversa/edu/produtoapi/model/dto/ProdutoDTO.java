package multiversa.edu.produtoapi.model.dto;

import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;

public record ProdutoDTO(
        @NotNull
        String nome,
        @NotNull
        BigDecimal valor
        ) {
}
