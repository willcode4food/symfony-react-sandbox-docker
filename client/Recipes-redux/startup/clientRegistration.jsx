import ReactOnRails from 'react-on-rails';
import RecipesApp from './RecipesAppClient';
import configureStore from '../store/recipesStore';

var recipesStore = configureStore;

ReactOnRails.registerStore({recipesStore})
ReactOnRails.register({ RecipesApp });
