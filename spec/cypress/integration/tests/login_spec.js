describe("Test Login", () => {
  beforeEach(() => {
    cy.app("clean");
    cy.visit("/users/sign_in");

    cy.get("#user_email").type("pastor@whelming.ml");
    cy.get("#user_password").type("password");
    cy.get(".button").click();

    cy.url().should("include", "/");
    cy.contains("Pedro Infante");
  });

  it("Flujo de Visita", () => {
    cy.visit("/request_visits");
    cy.get(":nth-child(1) > .Card").click();
    cy.get('.contentButtons > [rel="nofollow"]').click();
    cy.get(".switch").should("contain", "En Proceso");
    cy.get(".PanelTransparent-title").should("contain", "Visita");

    cy.get(".button").click();

    cy.get("#poll_academic_aspect").type("Aspectoooooo");
    cy.get("#poll_psychological_aspect").type("Aspectoooooo");
    cy.get("#poll_health_aspect").type("Aspectoooooo");
    cy.get("#poll_economic_aspect").type("Aspectoooooo");
    cy.get("#poll_spiritual_aspect").type("Aspectoooooo");
    cy.get("#poll_others").type("Aspectoooooo");

    const fileName = "evidencia.png";

    cy.fixture(fileName).then(fileContent => {
      cy.get("#poll_evidence").upload({
        fileContent,
        fileName,
        mimeType: "image/png"
      });
    });

    cy.get(".button").click();

    cy.get(".switch").should("contain", "Cerrado");




  });
});
