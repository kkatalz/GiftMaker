package dto;

import entity.CustomBuilder;
import entity.Item;
import entity.User;

public class ItemInCartDto {

    private User user;
    private Item item;
    private String amount;


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }



    public static class Builder implements CustomBuilder<ItemInCartDto> {
        ItemInCartDto itemInCart = new ItemInCartDto();

        public Builder setUser(User user) {
            itemInCart.user = user;
            return this;
        }

        public Builder setItem(Item item) {
            itemInCart.item = item;
            return this;
        }

        public Builder setAmount(String amount) {
            itemInCart.amount = amount;
            return this;
        }

        @Override
        public ItemInCartDto build() {
            return itemInCart;
        }
    }

    @Override
    public String toString() {
        return "ItemInCartDto{" +
                "user=" + user +
                ", item=" + item +
                ", amount=" + amount +
                '}';
    }
}
