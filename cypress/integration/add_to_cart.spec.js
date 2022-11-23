describe('adding to cart', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit('http://0.0.0.0:3000/');
  });

  it("cart should be 0 and 1 after clicking add", () => {
    cy.contains("My Cart (0)");
    cy.get("[alt=Add]")
      .first()
      .click({force: true});
    cy.contains("My Cart (1)");
  });

});