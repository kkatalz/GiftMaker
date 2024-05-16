package entity;

public class ItemInCart {
    private User user;
    private Item item;
    private int amount;

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

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }



    public static class Builder implements CustomBuilder<ItemInCart> {
        ItemInCart itemInCart = new ItemInCart();

      public Builder setUser(User user) {
          itemInCart.user = user;
          return this;
      }

      public Builder setItem(Item item) {
          itemInCart.item = item;
          return this;
      }

      public Builder setAmount(int amount) {
          itemInCart.amount = amount;
          return this;
      }

        @Override
        public ItemInCart build() {
            return itemInCart;
        }
    }

    @Override
    public String toString() {
        return "ItemInCart{" +
                "user=" + user +
                ", item=" + item +
                ", amount=" + amount +
                '}';
    }



}
