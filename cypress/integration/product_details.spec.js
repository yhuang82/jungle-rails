describe("Home Page", () => {


  it("There are products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("have.length", 2);
  });

  it("Navigate to product 1 and its details should be shown", () => {
    cy.contains('Giant Tea')
      .click()
    // check if the links to correct product
    cy.url().should('include', '/products')
    cy.get(".product-detail").should("be.visible");
    cy.get(".quantity").should("be.visible");
    cy.get(".price").should("be.visible");
  })
});
