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

  it("increases cart count when adding a product", () => {
    cy.get(".products article")
      .first()
      .find(".btn:contains('Add')")
      .click({ force: true });

    cy.get(".nav-item.end-0")
      .invoke("text")
      .then((text) => {
        const trimmedText = text.trim();
        expect(trimmedText).to.equal("My Cart (1)");
      });
  });
});
