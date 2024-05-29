package entity;

import javax.servlet.http.Part;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Item {
    private Integer id;
    private Category category;
    private String name;
    private BigDecimal price;
    private String description;
    private int amount;
    private int age;
    private List<String> base64Images = new ArrayList<>(); // for displaying
    private List<Part> parts = new ArrayList<>();


    public void addBase64Image(String image) {
        this.base64Images.add(image);
    }

    public void addPart(Part part) {
        this.parts.add(part);
    }

    public List<Part> getParts() {
        return this.parts;
    }

    public void setParts(List<Part> parts) {
        this.parts = parts;
    }

    public List<String> getBase64Images() {
        return this.base64Images;
    }

    public void setBase64Images(List<String> base64Images) {
        this.base64Images = base64Images;
    }


    public static class Builder implements CustomBuilder<Item> {
        Item item = new Item();

        public Builder setId(Integer id) {
            item.id = id;
            return this;
        }

        public Builder setCategory(Category category) {
            item.category = category;
            return this;
        }

        public Builder setName(String name) {
            item.name = name;
            return this;
        }

        public Builder setPrice(BigDecimal price) {
            item.price = price;
            return this;
        }

        public Builder setDescription(String description) {
            item.description = description;
            return this;
        }

        public Builder setAmount(int amount) {
            item.amount = amount;
            return this;
        }

        public Builder setAge(int age) {
            item.age = age;
            return this;
        }

        public Builder setBase64Image(List<String> base64Images) {
            item.base64Images = base64Images;
            return this;
        }


        public Builder setParts(List<Part> parts) {
            item.parts = parts;
            return this;
        }


        @Override
        public Item build() {
            return item;
        }
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "Item{" +
                "id=" + id +
                ", category=" + category +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", amount=" + amount +
                ", age=" + age +
                '}';
    }

}
