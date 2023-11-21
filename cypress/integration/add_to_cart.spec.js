describe("Cart", () => {
  it("There are products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("have.length", 2);
  });

  it("At home page: product is added to Cart and the cart should be increased by 1", () => {
    // Cart originally has 0 item;
    cy.get('nav')
      .contains('My Cart (0)');
    
    // add one item
    cy.contains("Add").first().click({ force: true });
    cy.get("nav").contains("My Cart (1)");

  })

    
});
