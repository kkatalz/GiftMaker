package dto;

import entity.Category;
import entity.CustomBuilder;

import javax.servlet.http.Part;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class ItemDto {

    private Integer id;
    private Category category;
    private String name;
    private String price;
    private String description;
    private String amount;
    private String age;
    private List<String> base64Images = new ArrayList<>(); // for displaying
    private List<Part> parts = new ArrayList<>();


    public void addBase64Image(String image) {
        this.base64Images.add(image);
    }

    public void addPart(Part part) {
        this.parts.add(part);
    }

    public static class Builder implements CustomBuilder<ItemDto> {
        ItemDto item = new ItemDto();

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

        public Builder setPrice(String price) {
            item.price = price;
            return this;
        }

        public Builder setDescription(String description) {
            item.description = description;
            return this;
        }

        public Builder setAmount(String amount) {
            item.amount = amount;
            return this;
        }

        public Builder setAage(String age) {
            item.age = age;
            return this;
        }

        public Builder setBase64Image(List<String> base64Images) {
            item.base64Images = base64Images;
            return this;
        }


        public Builder setPart(List<Part> parts) {
            item.parts = parts;
            return this;
        }


        @Override
        public ItemDto build() {
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

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public List<Part> getParts() {
        return parts;
    }

    public void setPart(List<Part> parts) {
        this.parts = parts;
    }

    @Override
    public String toString() {
        return "ItemDto{" +
                "id=" + id +
                ", category=" + category +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", amount=" + amount +
                ", age=" + age +
                ", base64Image='" + base64Images + '\'' +
                '}';
    }
}
