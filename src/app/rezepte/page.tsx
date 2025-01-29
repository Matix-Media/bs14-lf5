import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { query } from '@/lib/db';
import Link from 'next/link';

interface Recipe {
    rezeptnr: number;
    name: string;
    beschreibung: string | null;
    portionen: number | null;
    schwierigkeitsgrad: string | null;
    zubereitungszeit: number | null;
}

async function getRecipes() {
    try {
        const result = await query(`
      SELECT
        r.rezeptnr,
        r.name,
        r.beschreibung,
        r.portionen,
        r.schwierigkeitsgrad,
        r.zubereitungszeit,
        COUNT(rz.zutatennr) as zutatenzahl
      FROM rezept r
      LEFT JOIN rezeptzutat rz ON r.rezeptnr = rz.rezeptnr
      GROUP BY r.rezeptnr, r.name, r.beschreibung, r.portionen, r.schwierigkeitsgrad, r.zubereitungszeit
      ORDER BY r.name
    `);
        return result.rows;
    } catch (error) {
        console.error('Error fetching recipes:', error);
        throw new Error('Failed to fetch recipes');
    }
}

export const dynamic = 'force-dynamic'; // Disable static page generation

export default async function RecipesPage() {
    const recipes = await getRecipes();

    return (
        <div className="container mx-auto py-8">
            <div className="flex justify-between items-center mb-8">
                <h1 className="text-3xl font-bold">Unsere Rezepte</h1>
                <div className="space-x-4">
                    <Link
                        href="/rezepte/kategorie"
                        className="text-blue-600 hover:text-blue-800"
                    >
                        Nach Kategorie filtern
                    </Link>
                    <Link
                        href="/rezepte/zutat"
                        className="text-blue-600 hover:text-blue-800"
                    >
                        Nach Zutat suchen
                    </Link>
                </div>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                {recipes.map((recipe) => (
                    <Card key={recipe.rezeptnr} className="h-full">
                        <CardHeader>
                            <CardTitle>
                                <Link
                                    href={`/rezepte/${recipe.name}`}
                                    className="hover:text-blue-600 transition-colors"
                                >
                                    {recipe.name}
                                </Link>
                            </CardTitle>
                            <CardDescription>
                                {recipe.schwierigkeitsgrad && (
                                    <span className="mr-3">
                                        Schwierigkeit: {recipe.schwierigkeitsgrad}
                                    </span>
                                )}
                                {recipe.zubereitungszeit && (
                                    <span>
                                        {recipe.zubereitungszeit} Min.
                                    </span>
                                )}
                            </CardDescription>
                        </CardHeader>
                        <CardContent>
                            {recipe.beschreibung && (
                                <p className="text-gray-600 line-clamp-3">
                                    {recipe.beschreibung}
                                </p>
                            )}
                            <div className="mt-4 text-sm text-gray-500">
                                <p>Portionen: {recipe.portionen || 'Nicht angegeben'}</p>
                                <p>Anzahl Zutaten: {recipe.zutatenzahl}</p>
                            </div>
                        </CardContent>
                    </Card>
                ))}
            </div>
        </div>
    );
}
