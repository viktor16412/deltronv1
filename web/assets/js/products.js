document.addEventListener('DOMContentLoaded', function() {
    // Productos de ejemplo (deberías reemplazar esto con tu API real)
    const products = [
        {
            id: 1,
            name: 'Laptop Gamer ASUS ROG Strix G15',
            category: 'Laptops',
            price: 3499,
            originalPrice: 3999,
            image: 'https://images.unsplash.com/photo-1593642634524-b40b5baae6bb?w=600&q=80',
            rating: 4.5,
            badge: 'Nuevo'
        },
        {
            id: 2,
            name: 'Computadora All-in-One HP Pavilion',
            category: 'Computadoras',
            price: 2599,
            originalPrice: 2899,
            image: 'https://images.unsplash.com/photo-1592155931584-901ac15763e3?w=600&q=80',
            rating: 4.2,
            badge: 'Oferta'
        },
        {
            id: 3,
            name: 'Tablet Samsung Galaxy Tab S7',
            category: 'Tablets',
            price: 1799,
            originalPrice: 1999,
            image: 'https://images.unsplash.com/photo-1585771724684-38269d6639fd?w=600&q=80',
            rating: 4.7,
            badge: ''
        },
        {
            id: 4,
            name: 'Disco SSD 1TB Kingston KC3000',
            category: 'Almacenamiento',
            price: 499,
            originalPrice: 599,
            image: 'https://images.unsplash.com/photo-1581349485608-9469926a8e5e?w=600&q=80',
            rating: 4.8,
            badge: 'Más vendido'
        },
        {
            id: 5,
            name: 'Teclado Mecánico Redragon K552',
            category: 'Accesorios',
            price: 199,
            originalPrice: 249,
            image: 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=600&q=80',
            rating: 4.3,
            badge: ''
        },
        {
            id: 6,
            name: 'Monitor Gamer Curvo 27" Samsung',
            category: 'Monitores',
            price: 1299,
            originalPrice: 1499,
            image: 'https://images.unsplash.com/photo-1593642634524-b40b5baae6bb?w=600&q=80',
            rating: 4.6,
            badge: 'Oferta'
        }
    ];

    const productsContainer = document.getElementById('productos-container');
    const categoryFilter = document.querySelector('.category-filter select');

    // Mostrar productos
    function displayProducts(productsToShow) {
        productsContainer.innerHTML = '';
        
        productsToShow.forEach(product => {
            const discount = Math.round(((product.originalPrice - product.price) / product.originalPrice) * 100);
            
            const productCard = document.createElement('div');
            productCard.className = 'product-card';
            productCard.innerHTML = `
                <div class="product-img">
                    <img src="${product.image}" alt="${product.name}">
                    ${product.badge ? `<span class="product-badge">${product.badge}</span>` : ''}
                </div>
                <div class="product-info">
                    <span class="product-category">${product.category}</span>
                    <h3 class="product-title">${product.name}</h3>
                    <div class="product-price">
                        <span class="current-price">S/ ${product.price.toFixed(2)}</span>
                        <span class="original-price">S/ ${product.originalPrice.toFixed(2)}</span>
                        <span class="discount">-${discount}%</span>
                    </div>
                    <div class="product-meta">
                        <div class="product-rating">
                            ${'★'.repeat(Math.floor(product.rating))}${'☆'.repeat(5 - Math.floor(product.rating))}
                            <span>(${product.rating})</span>
                        </div>
                        <div class="product-actions">
                            <button class="btn-wishlist"><i class="bi bi-heart"></i></button>
                            <button class="btn-add-cart">Añadir</button>
                        </div>
                    </div>
                </div>
            `;
            
            productsContainer.appendChild(productCard);
        });
    }

    // Filtrar productos por categoría
    categoryFilter.addEventListener('change', function() {
        const selectedCategory = this.value;
        
        if (selectedCategory === 'Todas las categorías') {
            displayProducts(products);
        } else {
            const filteredProducts = products.filter(product => product.category === selectedCategory);
            displayProducts(filteredProducts);
        }
    });

    // Mostrar todos los productos al cargar
    displayProducts(products);
});