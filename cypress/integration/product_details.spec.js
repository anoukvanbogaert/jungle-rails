describe('home app', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit('http://0.0.0.0:3000/');
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("shows the product details when clicked", () => {
    cy.get(".products article")
      .first()
      .click();
    cy.get('article')
      .should('have.class', 'product-detail');
  });

});