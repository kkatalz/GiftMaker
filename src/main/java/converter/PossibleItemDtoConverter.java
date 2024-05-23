package converter;

import dto.PossibleItemDto;
import entity.PossibleItem;

import java.math.BigDecimal;

public class PossibleItemDtoConverter {

    public static PossibleItem toPossibleItem(PossibleItemDto dto) {
        return new PossibleItem.Builder()
                .setName(dto.getName())
                .setPrice(new BigDecimal(dto.getPrice()))
                .setDescription(dto.getDescription())
                .setAge(Integer.parseInt(dto.getAge()))
                .setPart(dto.getPart())
                .build();
    }
}
