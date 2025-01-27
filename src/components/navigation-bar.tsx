// components/navigation-bar.tsx
import { Menu, ShoppingCart, User } from "lucide-react";
import Image from "next/image";
import Link from "next/link";

const navigation = [
    { name: "Startseite", href: "/" },
    { name: "Rezepte", href: "/rezepte" },
    { name: "Produkte", href: "/produkte" },
    { name: "Über uns", href: "/ueber-uns" },
];

export function NavigationBar() {
    return (
        <nav className="bg-white border-b">
            <div className="container mx-auto px-4">
                <div className="flex h-16 items-center justify-between">
                    <div className="flex items-center">
                        <Link href="/" className="flex items-center space-x-2">
                            <Image
                                src="/logo.png"
                                alt="Kraut Rüben Logo"
                                width={40}
                                height={40}
                                className="h-10 w-auto"
                            />
                            <span className="text-xl font-semibold text-purple-800">
                                Kraut Rüben
                            </span>
                        </Link>
                    </div>

                    {/* Desktop Navigation */}
                    <div className="hidden md:flex md:items-center md:space-x-8">
                        {navigation.map((item) => (
                            <Link
                                key={item.name}
                                href={item.href}
                                className="text-gray-600 hover:text-purple-800 px-3 py-2 rounded-md text-sm font-medium"
                            >
                                {item.name}
                            </Link>
                        ))}
                    </div>

                    <div className="flex items-center space-x-4">
                        <Link
                            href="/warenkorb"
                            className="text-gray-600 hover:text-purple-800"
                        >
                            <ShoppingCart className="h-6 w-6" />
                        </Link>
                        <Link
                            href="/konto"
                            className="text-gray-600 hover:text-purple-800"
                        >
                            <User className="h-6 w-6" />
                        </Link>
                        <button className="md:hidden">
                            <Menu className="h-6 w-6" />
                        </button>
                    </div>
                </div>
            </div>
        </nav>
    );
}