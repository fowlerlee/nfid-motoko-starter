<script>
  import { Router, Link, Route } from "svelte-routing"
  import Home from "./routes/Home.svelte"
  import About from "./routes/About.svelte"
  import "./app.css"

  export let url = ""
</script>

<Router {url}>
  <nav>
    <Link to="/">Home</Link>
    <Link to="about">About</Link>
  </nav>
  <main>
    <Route path="/" component={Home} />
    <Route path="about" component={About} />
  </main>
</Router>

<style>
  nav {
    display: flex;
    gap: 2rem;
    padding: 2rem;
  }

  main {
    margin-top: 4rem;
    text-align: center;
  }
</style>
