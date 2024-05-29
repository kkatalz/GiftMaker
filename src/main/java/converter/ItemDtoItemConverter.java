package converter;

import dto.ItemDto;
import entity.Item;

import java.math.BigDecimal;

public class ItemDtoItemConverter {

    public static Item toItem(ItemDto dto) {
        return new Item.Builder()
                .setCategory(dto.getCategory())
                .setName(dto.getName())
                .setPrice(new BigDecimal(dto.getPrice()))
                .setDescription(dto.getDescription())
                .setAmount(Integer.parseInt(dto.getAmount()))
                .setAge(Integer.parseInt(dto.getAge()))
                .setParts(dto.getParts())
                .build();
    }
}
