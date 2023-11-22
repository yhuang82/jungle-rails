describe("User Create", () => {
  it("There are products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("have.length", 2);
  });

  it("Creates a new user and logs in the user", () => {
    // go to Signup page
    // signup page
    cy.contains("Signup").click();
    // fill in the form and check user auth
    const uniqueEmail = `albert+${Date.now()}@gmail.com`; 
    cy.get('[name="user[first_name]"]').type("Albert");
    cy.get('[name="user[last_name]"]').type("Huang");
    cy.get('[name="user[email]"]').type(`${uniqueEmail}`);
    cy.get('[name="user[password]"]').type("password");
    cy.get('[name="user[password_confirmation]"]').type("password");

    cy.get("[name=commit]").click();
    cy.contains("Hello, Albert");
    cy.contains("Logout").click();

    
        // fill in the form and check user auth

    cy.get("[id=email]").type(`${uniqueEmail}`);
    cy.get("[id=password]").type("password");
    cy.get("[name=commit]").click();
    cy.contains("Hello, Albert");
  });
});



// describe("User Login", () => {
//   it("There are products on the page", () => {
//     cy.visit("/");
//     cy.get(".products article").should("be.visible");
//   });

//   it("There are 2 products on the page", () => {
//     cy.visit("/");
//     cy.get(".products article").should("have.length", 2);
//   });

//   it("Logs in the user with matching email and password and redirects user to home page", () => {
//     // go to login page
//     cy.contains("Login").click();
//     cy.url().should("include", "/login");
//     // fill in the form and check user auth

//     cy.get("[id=email]").type("albert@gmail.com");
//     cy.get("[id=password]").type("password");
//     cy.get("[name=commit]").click();
//     cy.contains("Hello, Albert");
//   });
// });
