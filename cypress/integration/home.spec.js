describe("Jungle App", () => {
  beforeEach(() => {
    cy.visit("http://0.0.0.0:3000/");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});