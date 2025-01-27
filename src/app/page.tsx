// app/page.tsx
import { ArrowRight, HeartHandshake, Leaf, ShieldCheck } from "lucide-react";
import Image from "next/image";
import Link from "next/link";

export default async function HomePage() {
  return (
    <div className="space-y-16">
      {/* Hero Section */}
      <section className="text-center space-y-6 py-12">
        <h1 className="text-4xl md:text-6xl font-bold text-purple-800">
          Frische Bio-Lebensmittel
          <br />
          direkt zu Ihnen nach Hause
        </h1>
        <p className="text-xl text-gray-600 max-w-2xl mx-auto">
          Entdecken Sie unsere Auswahl an hochwertigen Bio-Produkten und lassen Sie sich von unseren
          nachhaltigen Rezepten inspirieren.
        </p>
        <div className="flex justify-center gap-4">
          <Link href="/produkte" className="btn-primary">
            Jetzt einkaufen
          </Link>
          <Link href="/rezepte" className="btn-secondary">
            Rezepte entdecken
          </Link>
        </div>
      </section>

      {/* Features */}
      <section className="grid md:grid-cols-3 gap-8">
        <div className="card text-center">
          <div className="flex justify-center mb-4">
            <Leaf className="h-12 w-12 text-green-600" />
          </div>
          <h3 className="text-xl font-semibold mb-2">100% Bio-Qualität</h3>
          <p className="text-gray-600">
            Alle unsere Produkte stammen aus kontrolliert biologischem Anbau.
          </p>
        </div>

        <div className="card text-center">
          <div className="flex justify-center mb-4">
            <ShieldCheck className="h-12 w-12 text-purple-600" />
          </div>
          <h3 className="text-xl font-semibold mb-2">Geprüfte Frische</h3>
          <p className="text-gray-600">
            Wir garantieren die Frische und Qualität unserer Produkte.
          </p>
        </div>

        <div className="card text-center">
          <div className="flex justify-center mb-4">
            <HeartHandshake className="h-12 w-12 text-red-600" />
          </div>
          <h3 className="text-xl font-semibold mb-2">Regional & Fair</h3>
          <p className="text-gray-600">
            Wir unterstützen lokale Bauern und faire Handelsbedingungen.
          </p>
        </div>
      </section>

      {/* Featured Recipes */}
      <section className="space-y-6">
        <div className="flex justify-between items-center">
          <h2 className="text-2xl font-bold">Beliebte Rezepte</h2>
          <Link
            href="/rezepte"
            className="text-purple-800 hover:text-purple-700 flex items-center gap-1"
          >
            Alle Rezepte <ArrowRight className="h-4 w-4" />
          </Link>
        </div>

        <div className="grid md:grid-cols-3 gap-8">
          {/* Recipe cards would be dynamically populated here */}
          <div className="card">
            <div className="relative h-48 mb-4">
              <Image
                src="/placeholder/recipe1.jpg"
                alt="Rezept Vorschau"
                fill
                className="object-cover rounded-md"
              />
            </div>
            <h3 className="font-semibold mb-2">Gemüse-Lasagne</h3>
            <p className="text-sm text-gray-600 mb-4">
              Eine herzhafte vegetarische Lasagne mit saisonalem Gemüse.
            </p>
            <Link href="/rezepte/1" className="text-purple-800 hover:text-purple-700">
              Zum Rezept →
            </Link>
          </div>
          {/* More recipe cards... */}
        </div>
      </section>
    </div>
  );
}