<script>
  let pokemon = ""
  let showPokemon = fetchPokemon()

  async function fetchPokemon(pokemon = "pikachu") {
    let response = await fetch(`https://pokeapi.co/api/v2/pokemon/${pokemon}`)
    let { name, sprites } = await response.json()
    let artwork = sprites.other["official-artwork"]["front_default"]
    return { name, artwork }
  }

  function handleSubmit() {
    showPokemon = fetchPokemon(pokemon)
  }
</script>

<h1>Submit Proposals for Pokémon</h1>
<h2>Best skills, power, courage, endurance, whatever</h2>
<h2>Gotta submit for them all!!</h2>
<form on:submit|preventDefault={handleSubmit}>
  <input bind:value={pokemon} type="text" />
</form>

{#await showPokemon}
  <p>Fetching Pokemon...</p>
{:then pokemon}
  <img src={pokemon.artwork} alt={pokemon.name} />
{:catch error}
  <p>Invalid Pokemon name.</p>
{/await}
