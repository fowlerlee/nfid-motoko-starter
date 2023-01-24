<script>
  import { AuthClient } from "@dfinity/auth-client"
  import * as counter from "../../src/declarations/counter"
  import { Actor } from "@dfinity/agent"
    import { get } from "svelte/store"

  export let authClient = null
  export let principalId = ""
  export let chosenproposal = "Input your proposal"
  export let greeting = ""
  export let value = getValue()
  $: whoami = greeting

  async function init() {
    try {
      authClient = await AuthClient.create()
    } catch (error) {
      console.error("Error msg: err")
      throw new Error("AuthClient not initialized")
    }
  }

  async function greet(params) {
    greeting = await counter.greet(params)
  }

  async function increment() {
    increment = await counter.increment()
    getValue()
  }

  async function getValue() {
    value = await counter.getValue()
  }

  function handleSuccess() {
    principalId = authClient.getIdentity().getPrincipal().toText()

    Actor.agentOf(counter).replaceIdentity(authClient.getIdentity())
  }

  function login() {
    init()
    if (!authClient) throw new Error("AuthClient not initialized")

    const APP_NAME = "Lee's dapp"
    const APP_LOGO = "https://nfid.one/icons/favicon-96x96.png"
    const CONFIG_QUERY = `?applicationName=${APP_NAME}&applicationLogo=${APP_LOGO}`

    const identityProvider = `https://nfid.one/authenticate${CONFIG_QUERY}`

    authClient.login({
      identityProvider,
      onSuccess: handleSuccess,

      windowOpenerFeatures: `
    left=${window.screen.width / 2 - 525 / 2},
    top=${window.screen.height / 2 - 705 / 2},
    toolbar=0,location=0,menubar=0,width=525,height=705
  `,
    })
  }
</script>

<main>
  <h1>About</h1>
  <section class="panel">
    <p>{`Your PrincipalId: ${principalId}`}</p>

    <button class="login-button" on:click|preventDefault={login}>
      Login
    </button>
  </section>

  <section class="panel">
    <p>{`Canister msg:-> ${whoami}`}</p>
    <input
      bind:value={chosenproposal}
      placeholder="Input your proposal summary here"
    />
    <button class="login-button" on:click|preventDefault={() => greet(chosenproposal)}
      >Greet</button
    >
  </section>
  <section class="panel">
    <p>Fetch any Pokemon!</p>
    <p>Call dfintiy actor on chain</p>
    <button class="login-button" on:click|preventDefault={increment}
      >Increment</button
    >
  </section>
</main>

<style>
  .panel {
    border: 1px solid white;
    border-radius: 10px;
    margin-bottom: 2vmin;
    padding: 2vmin;
  }

  .login-button {
    /* Adding the rounded corners */
    border-radius: 20px;
    border: 1px solid #000;
    padding: 10px 20px;
    background: yellow;
    font-size: 2em;
    cursor: pointer;

    background-color: #48abe0;
    color: white;
    border: none;
    padding: 7px;
    font-size: 25px;
    height: 90px;
    width: 90px;
    box-shadow: 0 2px 4px darkslategray;
    cursor: pointer;
    transition: all 0.2s ease;
  }
</style>
