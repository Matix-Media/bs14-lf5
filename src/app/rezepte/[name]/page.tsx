import { query } from '@/lib/db';
import { notFound } from 'next/navigation';

interface RecipeDetail {
    rezeptnr: number;
    name: string;
    beschreibung: string;
    portionen: number;
    schwierigkeitsgrad: string;
    zubereitungszeit: number;
    zutaten: {
        bezeichnung: string;
        menge: number;
        einheit: string;
    }[];
}

async function getRecipeByName(name: string): Promise<RecipeDetail | null> {
    try {
        const result = await query(`
      SELECT
        r.rezeptnr,
        r.name,
        r.beschreibung,
        r.portionen,
        r.schwierigkeitsgrad,
        r.zubereitungszeit,
        json_agg(
          json_build_object(
            'bezeichnung', z.bezeichnung,
            'menge', rz.menge,
            'einheit', rz.einheit
          )
        ) as zutaten
      FROM rezept r
      LEFT JOIN rezeptzutat rz ON r.rezeptnr = rz.rezeptnr
      LEFT JOIN zutat z ON rz.zutatennr = z.zutatennr
      WHERE r.name = $1
      GROUP BY r.rezeptnr
    `, [name]);

        return result.rows[0] || null;
    } catch (error) {
        console.error('Error fetching recipe:', error);
        throw new Error('Failed to fetch recipe');
    }
}

export default async function RecipeDetailPage({ params }: { params: { name: string } }) {
    const recipe = await getRecipeByName(decodeURIComponent(params.name));

    if (!recipe) {
        notFound();
    }

    return (
        <div className="container mx-auto px-4 py-8">
            <h1 className="text-3xl font-bold mb-4">{recipe.name}</h1>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
                <div>
                    <div className="bg-white rounded-lg shadow-md p-6 mb-6">
                        <h2 className="text-xl font-semibold mb-4">Details</h2>
                        <div className="space-y-2">
                            <p><strong>Portionen:</strong> {recipe.portionen}</p>
                            <p><strong>Schwierigkeitsgrad:</strong> {recipe.schwierigkeitsgrad}</p>
                            <p><strong>Zubereitungszeit:</strong> {recipe.zubereitungszeit} Minuten</p>
                        </div>
                    </div>

                    <div className="bg-white rounded-lg shadow-md p-6">
                        <h2 className="text-xl font-semibold mb-4">Zutaten</h2>
                        <ul className="space-y-2">
                            {recipe.zutaten.map((zutat, index) => (
                                <li key={index} className="flex justify-between">
                                    <span>{zutat.bezeichnung}</span>
                                    <span>{zutat.menge} {zutat.einheit}</span>
                                </li>
                            ))}
                        </ul>
                    </div>
                </div>

                <div className="bg-white rounded-lg shadow-md p-6">
                    <h2 className="text-xl font-semibold mb-4">Zubereitung</h2>
                    <p className="whitespace-pre-line">{recipe.beschreibung}</p>
                </div>
            </div>
        </div>
    );
}
