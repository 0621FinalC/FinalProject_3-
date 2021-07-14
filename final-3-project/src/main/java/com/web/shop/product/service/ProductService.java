package com.web.shop.product.service;

import java.util.List;

import com.web.shop.product.dto.ProductDTO;

public interface ProductService {
    List<ProductDTO> listProduct();
    List<ProductDTO> listSearchProduct(String keyword);
    ProductDTO detailProduct(int product_id);
    void updateProduct(ProductDTO dto);
    void deleteProduct(int product_id);
    void insertProduct(ProductDTO dto);
    String fileInfo(int product_id);
}
