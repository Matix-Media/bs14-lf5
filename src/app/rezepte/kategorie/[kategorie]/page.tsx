import { query } from '@/lib/db';
import { notFound } from 'next/navigation';

interface Recipe {
    rezeptnr: number;
    name: string;
    beschreibung: string;
    portionen: number;
    schwierigkeitsgrad: string;
    zubereitungszeit: number;
}

async function getRecipesByCategory(category: string): Promise<Recipe[]> {
    try {
        const result = await query(`
      SELECT DISTINCT
        r.rezeptnr,
        r.name,
        r.beschreibung,
        r.portionen,
        r.schwierigkeitsgrad,
        r.zubereitungszeit
      FROM rezept r
      JOIN rezept_kategorie rk ON r.rezeptnr = rk.rezeptnr
      JOIN ernaehrungskategorie ek ON rk.kategorienr = ek.kategorienr
      WHERE ek.name = $1
      ORDER BY r.name
    `, [category]);

        return result.rows;
    } catch (error) {
        console.error('Error fetching recipes by category:', error);
        throw new Error('Failed to fetch recipes');
    }
}

export default async function CategoryPage({ params }: { params: { kategorie: string } }) {
    const recipes = await getRecipesByCategory(decodeURIComponent(params.kategorie));

    if (!recipes.length) {
        notFound();
    }

    return (
        <div className="container mx-auto px-4 py-8">
            <h1 className="text-3xl font-bold mb-8">
                Rezepte: {decodeURIComponent(params.kategorie)}
            </h1>

            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                {recipes.map((recipe) => (
                    <div key={recipe.rezeptnr} className="bg-white rounded-lg shadow-md overflow-hidden">
                        <div className="p-6">
                            <h2 className="text-xl font-semibold mb-2">{recipe.name}</h2>
                            <p className="text-gray-600 mb-4 line-clamp-2">
                                {recipe.beschreibung || 'Keine Beschreibung verfügbar'}
                            </p>
                            <div className="flex justify-between text-sm text-gray-500">
                                <span>{recipe.zubereitungszeit} Min.</span>
                                <span>{recipe.schwierigkeitsgrad}</span>
                                <span>{recipe.portionen} Portionen</span>
                            </div>
                        </div>
                    </div>
                ))}
            </div>
        </div>
    );
}