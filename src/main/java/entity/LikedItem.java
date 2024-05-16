package entity;

public class LikedItem {
    private User user;
    private Item item;


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
