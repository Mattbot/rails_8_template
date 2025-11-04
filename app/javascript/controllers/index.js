// Import and register all your controllers for esbuild
import { application } from "./application"
import HelloController from "./hello_controller"

application.register("hello", HelloController)
