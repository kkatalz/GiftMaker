package entity;

public class LikedItem {
    private User user;
    private Item item;


    public static class Builder implements CustomBuilder<LikedItem> {
        LikedItem likedItem = new LikedItem();

        public Builder setUser(User user) {
            likedItem.user = user;
            return this;
        }

        public Builder setItem(Item item) {
            likedItem.item = item;
            return this;
        }

        @Override
        public LikedItem build() {
            return likedItem;
        }
    }

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

    @Override
    public String toString() {
        return "LikedItem{" +
                "user=" + user +
                ", item=" + item +
                '}';
    }
}
