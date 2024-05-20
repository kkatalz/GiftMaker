package converter;

import dto.ItemInCartDto;
import entity.ItemInCart;

public class ItemInCartDtoConverter {

    public static ItemInCart toItemInCart(ItemInCartDto dto) {
        return new ItemInCart.Builder()
                .setUser(dto.getUser())
                .setItem(dto.getItem())
                .setAmount(Integer.parseInt(dto.getAmount()))
                .build();
    }
}
